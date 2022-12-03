from datetime import datetime
from typing import Literal, TypeAlias, TypedDict

point_t: TypeAlias = tuple[float, float] | list[float]
JsonStop: TypeAlias = dict[str, list[float]]
Directions_t: TypeAlias = str | Literal["N", "S"]


class JsonStation(TypedDict):
    id: str
    location: list[float]
    name: str
    stops: list[JsonStop]


JsonStations: TypeAlias = dict[str, JsonStation]


class Train(TypedDict):
    route: str
    time: datetime


class StationSeralized(TypedDict):
    id: str
    location: list[float]
    name: str
    stops: list[JsonStop]
    N: list[Train]
    S: list[Train]
    routes: set[str]
    last_update: datetime | None
