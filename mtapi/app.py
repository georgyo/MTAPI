# coding: utf-8
# typing: ignore
"""
    mta-api-sanity
    ~~~~~~

    Expose the MTA's real-time subway feed as a json api

    :copyright: (c) 2014 by Jon Thornton.
    :license: BSD, see LICENSE for more details.
"""

import logging
import os
import typing as t
from datetime import datetime
from functools import reduce, wraps

import flask
from flask import Flask, abort, jsonify, redirect, render_template, request
from flask.json import JSONEncoder
from flask_rebar import Rebar, SwaggerV3Generator, errors

from . import models as m
from .mtapi import Mtapi

app = Flask(__name__)
app.config.update(MAX_TRAINS=10, MAX_MINUTES=30, CACHE_SECONDS=60, THREADED=True)

rebar = Rebar()
registry = rebar.create_handler_registry(
    swagger_generator=SwaggerV3Generator(
        title="MTAPI",
    ),
)

_SETTINGS_ENV_VAR = "MTAPI_SETTINGS"
_SETTINGS_DEFAULT_PATH = "./settings.cfg"
if _SETTINGS_ENV_VAR in os.environ:
    app.config.from_envvar(_SETTINGS_ENV_VAR)
elif os.path.isfile(_SETTINGS_DEFAULT_PATH):
    app.config.from_pyfile(_SETTINGS_DEFAULT_PATH)
else:
    raise Exception("No configuration found! Create a settings.cfg file or set MTAPI_SETTINGS env variable.")

# set debug logging
if app.debug:
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
    )


class CustomJSONEncoder(JSONEncoder):
    def default(self, obj: t.Any) -> t.Any:
        try:
            if isinstance(obj, datetime):
                return obj.isoformat()
            iterable = iter(obj)
        except TypeError:
            pass
        else:
            return list(iterable)
        return JSONEncoder.default(self, obj)


app.json_encoder = CustomJSONEncoder

mta = Mtapi(
    app.config["MTA_KEY"],
    app.config["STATIONS_FILE"],
    max_trains=app.config["MAX_TRAINS"],
    max_minutes=app.config["MAX_MINUTES"],
    expires_seconds=app.config["CACHE_SECONDS"],
    threaded=app.config["THREADED"],
)

P = t.ParamSpec("P")


def cross_origin(f: t.Callable[P, flask.Response]) -> t.Callable[P, flask.Response]:
    @wraps(f)
    def decorated_function(*args: P.args, **kwargs: P.kwargs) -> flask.Response:
        resp = f(*args, **kwargs)

        if app.config["DEBUG"]:
            resp.headers["Access-Control-Allow-Origin"] = "*"
        elif "CROSS_ORIGIN" in app.config:
            resp.headers["Access-Control-Allow-Origin"] = app.config["CROSS_ORIGIN"]

        return resp

    return decorated_function


@app.route("/")
@cross_origin
def index() -> flask.Response:
    return flask.redirect("/swagger/ui", 307)


@registry.handles(
    rule="/by-location",
    method="GET",
    query_string_schema=m.ByLocationQueryStringSchema,
    response_body_schema=m.ComplexResponseSchema,
)
@cross_origin
def by_location() -> flask.Response:
    body = rebar.validated_args
    try:
        location = (float(body.lat), float(body.lon))
    except KeyError as e:
        print(e)
        response = jsonify({"error": "Missing lat/lon parameter"})
        response.status_code = 400
        return response

    data = mta.get_by_point(location, 5)
    return _make_envelope(data)


@registry.handles(
    rule="/by-route/<route>",
    method="GET",
    response_body_schema=m.ComplexResponseSchema,
)
@cross_origin
def by_route(route: str) -> flask.Response | t.Any:

    if route.islower():
        return redirect(request.host_url + "by-route/" + route.upper(), code=301)

    try:
        data = mta.get_by_route(route)
        return _make_envelope(data)
    except KeyError as e:
        abort(404)


@registry.handles(
    rule="/by-id/<id_string>",
    method="GET",
    response_body_schema=m.ComplexResponseSchema,
)
@cross_origin
def by_index(id_string: str) -> flask.Response:
    ids = id_string.split(",")
    try:
        data = mta.get_by_id(ids)
        return _make_envelope(data)
    except KeyError as e:
        abort(404)


@registry.handles(
    rule="/routes",
    method="GET",
    response_body_schema=m.RoutesResponseSchema,
)
@cross_origin
def routes() -> flask.Response:
    return jsonify({"data": sorted(mta.get_routes()), "updated": mta.last_update()})


def _envelope_reduce(a: m.Complex, b: m.Complex) -> m.Complex:
    if a.last_update and b.last_update:
        return a if a.last_update < b.last_update else b
    elif a.last_update:
        return a
    else:
        return b


def _make_envelope(data: list[m.Complex]) -> flask.Response:
    time = None
    if data:
        time = reduce(_envelope_reduce, data).last_update

    return jsonify({"data": data, "updated": time})


def main() -> None:
    rebar.init_app(app)
    app.run(use_reloader=False, port=int(os.environ.get("PORT", "5000")))


if __name__ == "__main__":
    main()
