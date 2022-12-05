import contextlib
import copy
import datetime
import json
import logging
import math
import pathlib
import threading
import typing as t
import urllib.error
import urllib.request
from collections import defaultdict
from itertools import islice
from operator import attrgetter
from os.path import isfile, join

import certifi
import google.protobuf.message

from mtaproto import TZ, FeedResponse, Trip, TripStop

from . import models as m
from ._mtapithreader import _MtapiThreader
from ._typing import Directions_t, JsonStation, JsonStations, point_t

logger = logging.getLogger(__name__)


def distance(p1: point_t, p2: point_t) -> float:
    return math.sqrt((p2[0] - p1[0]) ** 2 + (p2[1] - p1[1]) ** 2)


class Station(object):
    last_update = None
    trains: dict[Directions_t, list[m.TrainStop]]
    routes: set[str]

    def __init__(self, json: JsonStation):
        self.json = json
        self.trains = {}
        self.clear_train_data()

    def __getitem__(self, key: str) -> t.Any:
        return self.json.__getitem__(key)

    def add_train(
        self,
        route_id: str,
        direction: Directions_t,
        train_time: datetime.datetime,
        feed_time: datetime.datetime,
    ) -> None:
        self.routes.add(route_id)
        self.trains[direction].append(m.TrainStop(route=route_id, time=train_time))
        self.last_update = feed_time

    def clear_train_data(self) -> None:
        self.trains["N"] = []
        self.trains["S"] = []
        self.routes = set()
        self.last_update = None

    def sort_trains(self, max_trains: int) -> None:
        self.trains["S"] = sorted(self.trains["S"], key=attrgetter("time"))[:max_trains]
        self.trains["N"] = sorted(self.trains["N"], key=attrgetter("time"))[:max_trains]

    def serialize(self) -> m.Complex:
        out = m.Complex(
            N=self.trains["N"],
            S=self.trains["S"],
            routes=self.routes,
            last_update=self.last_update,
            id=self.json["id"],
            name=self.json["name"],
            stops=self.json["stops"],
            location=self.json["location"],
        )
        return out


class Mtapi(object):

    _FEED_URLS = [
        "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs",  # 1234567S
        "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-l",  # L
        "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-nqrw",  # NRQW
        "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-bdfm",  # BDFM
        "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-ace",  # ACE
        "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-si",  # (SIR)
        "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-jz",  # JZ
        "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs-g",  # G
    ]

    def __init__(
        self,
        key: str,
        stations_file: str,
        expires_seconds: int = 60,
        max_trains: int = 10,
        max_minutes: int = 30,
        threaded: bool = False,
    ):
        self._KEY = key
        self._MAX_TRAINS = max_trains
        self._MAX_MINUTES = max_minutes
        self._EXPIRES_SECONDS = expires_seconds
        self._THREADED = threaded
        self._stations: dict[str, Station] = {}
        self._stops_to_stations: dict[str, str] = {}
        self._routes: dict[str, set[str]] = {}
        self._read_lock = threading.RLock()

        if stations_file[0] != "/":
            if isfile(stations_file):
                pass
            elif isfile(join("../", stations_file)):
                stations_file = join("../", stations_file)
            elif isfile(join(pathlib.Path(__file__).parent.parent.resolve(), stations_file)):
                stations_file = join(pathlib.Path(__file__).parent.parent.resolve(), stations_file)

        # initialize the stations database
        try:
            with open(stations_file, "r") as f:
                station_data: JsonStations = json.load(f)

                for id in station_data:
                    self._stations[id] = Station(station_data[id])
                self._stops_to_stations = self._build_stops_index(self._stations)

        except IOError as e:
            print("Couldn't load stations file " + stations_file)
            exit()

        self._update()

        if threaded:
            self.threader = _MtapiThreader(self, expires_seconds)
            self.threader.start_timer()

    @staticmethod
    def _build_stops_index(stations: dict[str, Station]) -> dict[str, str]:
        stops: dict[str, str] = {}
        for station_id in stations:
            for stop_id in stations[station_id]["stops"].keys():
                stops[stop_id] = station_id

        return stops

    def _load_mta_feed(self, feed_url: str) -> FeedResponse | t.Literal[False]:
        try:
            request = urllib.request.Request(feed_url)
            request.add_header("x-api-key", self._KEY)
            with contextlib.closing(urllib.request.urlopen(request, cafile=certifi.where())) as r:
                data = r.read()
                return FeedResponse(data)

        except (
            urllib.error.URLError,
            google.protobuf.message.DecodeError,
            ConnectionResetError,
        ) as e:
            logger.error("Couldn't connect to MTA server: " + str(e))
            return False

    def _update(self) -> None:
        logger.info("updating...")
        self._last_update = datetime.datetime.now(TZ)

        # create working copy for thread safety
        stations = copy.deepcopy(self._stations)

        # clear old times
        for id in stations:
            stations[id].clear_train_data()

        routes: dict[str, set[str]] = defaultdict(set)

        for i, feed_url in enumerate(self._FEED_URLS):
            mta_data = self._load_mta_feed(feed_url)

            if not mta_data:
                continue

            max_time = self._last_update + datetime.timedelta(minutes=self._MAX_MINUTES)

            for entity in mta_data.entity:
                trip = Trip(entity)

                if not trip.is_valid():
                    continue

                direction = trip.direction[0]
                route_id = trip.route_id.upper()

                for update in entity.trip_update.stop_time_update:
                    trip_stop = TripStop(update)

                    if trip_stop.time < self._last_update or trip_stop.time > max_time:
                        continue

                    stop_id = trip_stop.stop_id

                    if stop_id not in self._stops_to_stations:
                        logger.info("Stop %s not found", stop_id)
                        continue

                    station_id = self._stops_to_stations[stop_id]
                    stations[station_id].add_train(route_id, direction, trip_stop.time, mta_data.timestamp)

                    routes[route_id].add(stop_id)

        # sort by time
        for id in stations:
            stations[id].sort_trains(self._MAX_TRAINS)

        with self._read_lock:
            self._routes = routes
            self._stations = stations

    def last_update(self) -> datetime.datetime:
        return self._last_update

    def get_by_point(self, point: point_t, limit: int = 5) -> list[m.Complex]:
        if self.is_expired():
            self._update()

        with self._read_lock:
            sortable_stations = copy.deepcopy(self._stations).values()

        sorted_stations = sorted(sortable_stations, key=lambda s: distance(s["location"], point))
        serialized_stations = map(lambda s: s.serialize(), sorted_stations)

        return list(islice(serialized_stations, limit))

    def get_routes(self) -> list[str]:
        return list(self._routes.keys())

    def get_by_route(self, route: str) -> list[m.Complex]:
        route = route.upper()

        if self.is_expired():
            self._update()

        with self._read_lock:
            out = [self._stations[self._stops_to_stations[k]].serialize() for k in self._routes[route]]

        out.sort(key=lambda x: x.name)
        return out

    def get_by_id(self, ids: list[str]) -> list[m.Complex]:
        if self.is_expired():
            self._update()

        with self._read_lock:
            out = [self._stations[k].serialize() for k in ids]

        return out

    def is_expired(self) -> bool:
        if self._THREADED and self.threader and self.threader.restart_if_dead():
            return False
        elif self._EXPIRES_SECONDS:
            age = datetime.datetime.now(TZ) - self._last_update
            return age.total_seconds() > self._EXPIRES_SECONDS
        else:
            return False
