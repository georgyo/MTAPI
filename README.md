# MTA Realtime API JSON Proxy

MTAPI is a small HTTP server that converts the [MTA's realtime subway feed](https://api.mta.info/#/landing) from [Protocol Buffers/GTFS](https://developers.google.com/transit/gtfs/) to JSON. The app also adds caching and makes it possible to retrieve information by location and train line. 

## Active Development

This project is under active development and any part of the API may change. Feedback is very welcome.

## Running the server

MTAPI is a Flask app designed to run under Python 3.3+.

1. Create a `settings.cfg` file. A sample is provided as `settings.cfg.sample`.
2. poetry install
3. poetry run app
If your configuration is named something other than `settings.cfg`, set the `MTAPI_SETTINGS` env variable to your configuration path.

This app makes use of Python threads. If running under uWSGI include the --enable-threads flag.

## Endpoints

[Endpoints to retrieve train data and sample input and output are listed here.](https://github.com/jonthornton/MTAPI/tree/master/docs/endpoints.md)

## Settings

- **MTA_KEY** (required)  
The API key provided at hhttps://api.mta.info/#/signup
*default: None*

- **STATIONS_FILE** (required)  
Path to the JSON file containing station information. See [Generating a Stations File](#generating-a-stations-file) for more info.  
*default: None*

- **CROSS_ORIGIN**    
Add [CORS](http://enable-cors.org/) headers to the HTTP output.  
*default: "&#42;" when in debug mode, None otherwise*

- **MAX_TRAINS**  
Limits the number of trains that will be listed for each station.  
*default: 10*

- **MAX_MINUTES**  
Limits how far in advance train information will be listed.  
*default: 30*

- **CACHE_SECONDS**  
How frequently the app will request fresh data from the MTA API.  
*default: 60*

- **THREADED**  
Enable background data refresh. This will prevent requests from hanging while new data is retreived from the MTA API.  
*default: True*

- **DEBUG**  
Standard Flask option. Will enabled enhanced logging and wildcard CORS headers.  
*default: False*

## Generating a Stations File

Usage: 
```
$ python scripts/make_stations_json.py --output data/stations.json
```

## Help

Submit a [GitHub Issues request](https://github.com/jonthornton/MTAPI/issues). 

## Projects

Here are some projects that use MTAPI.

* http://wheresthefuckingtrain.com

## License

The project is made available under the MIT license.
