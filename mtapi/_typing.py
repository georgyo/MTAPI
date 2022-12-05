from typing import Literal, TypeAlias, TypedDict, Union

point_t: TypeAlias = Union[tuple[float, float], list[float]]
JsonStops: TypeAlias = dict[str, list[float]]
Directions_t: TypeAlias = str | Literal["N", "S"]


class JsonStation(TypedDict):
    id: str
    location: list[float]
    name: str
    stops: JsonStops


JsonStations: TypeAlias = dict[str, JsonStation]
