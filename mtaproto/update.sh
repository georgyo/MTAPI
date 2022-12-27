#! /usr/bin/nix-shell
#! nix-shell -i bash -p protobuf curl protoc-gen-go

set -euo pipefail

curl https://developers.google.com/static/transit/gtfs-realtime/gtfs-realtime.proto -o gtfs_realtime.proto

curl https://api.mta.info/nyct-subway.proto.txt -o nyct_subway.proto

sed -i -e 's/gtfs-realtime.proto/gtfs_realtime.proto/' nyct_subway.proto

# protoc -I=. --go_out=. -M=georgyo/mtapi/mtaproto gtfs-realtime.proto nyct-subway.proto

