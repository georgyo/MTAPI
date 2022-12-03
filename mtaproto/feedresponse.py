import datetime

from google.protobuf.internal.containers import RepeatedCompositeFieldContainer
from pytz import timezone

from . import gtfs_realtime_pb2, nyct_subway_pb2

TZ = timezone("US/Eastern")


class FeedResponse(object):
    def __init__(self, response_string: bytes):
        gtfs_realtime_pb2.FeedMessage()
        self._pb_data = gtfs_realtime_pb2.FeedMessage()
        self._pb_data.ParseFromString(response_string)

    @property
    def timestamp(self) -> datetime.datetime:
        return datetime.datetime.fromtimestamp(self._pb_data.header.timestamp, TZ)

    @property
    def entity(self) -> RepeatedCompositeFieldContainer[gtfs_realtime_pb2.FeedEntity]:
        return self._pb_data.entity


class Trip(object):
    def __init__(self, pb_data: gtfs_realtime_pb2.FeedEntity):
        self._pb_data = pb_data

    @property
    def direction(self) -> str:
        trip_meta = self._pb_data.trip_update.trip.Extensions[nyct_subway_pb2.nyct_trip_descriptor]
        return nyct_subway_pb2.NyctTripDescriptor.Direction.Name(trip_meta.direction)

    @property
    def route_id(self) -> str:
        if self._pb_data.trip_update.trip.route_id == "GS":
            return "S"
        else:
            return self._pb_data.trip_update.trip.route_id

    def is_valid(self) -> bool:
        return bool(self._pb_data.trip_update)


class TripStop(object):
    def __init__(self, pb_data: gtfs_realtime_pb2.TripUpdate.StopTimeUpdate):
        self._pb_data = pb_data

    @property
    def time(self) -> datetime.datetime:
        raw_time = self._pb_data.arrival.time or self._pb_data.departure.time
        return datetime.datetime.fromtimestamp(raw_time, TZ)

    @property
    def stop_id(self) -> str:
        return str(self._pb_data.stop_id[:3])
