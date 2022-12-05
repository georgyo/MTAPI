import typing as t
from dataclasses import dataclass, field
from datetime import datetime

from marshmallow import fields
from marshmallow_dataclass import class_schema

from ._typing import point_t

Stops: t.TypeAlias = dict[str, list[float]]


@dataclass
class ByLocationQueryString:
    lat: float
    lon: float


@dataclass
class TrainStop:
    route: str
    time: datetime


@dataclass
class Complex:
    id: str
    location: point_t = field(metadata={"marshmallow_field": fields.List(fields.Float())})
    name: str
    stops: Stops
    N: list[TrainStop]
    S: list[TrainStop]
    routes: set[str]
    last_update: datetime | None


@dataclass
class ComplexResponse:
    updated: datetime
    data: list[Complex]


@dataclass
class JsonStation:
    id: str
    location: point_t = field(metadata={"marshmallow_field": fields.List(fields.Float())})
    name: str
    stops: Stops


@dataclass
class RoutesResponse:
    data: list[str]
    updated: datetime


ByLocationQueryStringSchema = class_schema(ByLocationQueryString)
ComplexResponseSchema = class_schema(ComplexResponse)
RoutesResponseSchema = class_schema(RoutesResponse)
