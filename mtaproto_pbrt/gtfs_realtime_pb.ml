[@@@ocaml.warning "-27-30-39"]

type feed_header_mutable = {
  mutable gtfs_realtime_version : string;
  mutable incrementality : Gtfs_realtime_types.feed_header_incrementality option;
  mutable timestamp : int64 option;
}

let default_feed_header_mutable () : feed_header_mutable = {
  gtfs_realtime_version = "";
  incrementality = Some (Gtfs_realtime_types.default_feed_header_incrementality ());
  timestamp = None;
}

type trip_descriptor_mutable = {
  mutable trip_id : string option;
  mutable route_id : string option;
  mutable direction_id : int32 option;
  mutable start_time : string option;
  mutable start_date : string option;
  mutable schedule_relationship : Gtfs_realtime_types.trip_descriptor_schedule_relationship option;
}

let default_trip_descriptor_mutable () : trip_descriptor_mutable = {
  trip_id = None;
  route_id = None;
  direction_id = None;
  start_time = None;
  start_date = None;
  schedule_relationship = None;
}

type vehicle_descriptor_mutable = {
  mutable id : string option;
  mutable label : string option;
  mutable license_plate : string option;
}

let default_vehicle_descriptor_mutable () : vehicle_descriptor_mutable = {
  id = None;
  label = None;
  license_plate = None;
}

type trip_update_stop_time_event_mutable = {
  mutable delay : int32 option;
  mutable time : int64 option;
  mutable uncertainty : int32 option;
}

let default_trip_update_stop_time_event_mutable () : trip_update_stop_time_event_mutable = {
  delay = None;
  time = None;
  uncertainty = None;
}

type trip_update_stop_time_update_mutable = {
  mutable stop_sequence : int32 option;
  mutable stop_id : string option;
  mutable arrival : Gtfs_realtime_types.trip_update_stop_time_event option;
  mutable departure : Gtfs_realtime_types.trip_update_stop_time_event option;
  mutable schedule_relationship : Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship option;
}

let default_trip_update_stop_time_update_mutable () : trip_update_stop_time_update_mutable = {
  stop_sequence = None;
  stop_id = None;
  arrival = None;
  departure = None;
  schedule_relationship = Some (Gtfs_realtime_types.default_trip_update_stop_time_update_schedule_relationship ());
}

type trip_update_mutable = {
  mutable trip : Gtfs_realtime_types.trip_descriptor;
  mutable vehicle : Gtfs_realtime_types.vehicle_descriptor option;
  mutable stop_time_update : Gtfs_realtime_types.trip_update_stop_time_update list;
  mutable timestamp : int64 option;
  mutable delay : int32 option;
}

let default_trip_update_mutable () : trip_update_mutable = {
  trip = Gtfs_realtime_types.default_trip_descriptor ();
  vehicle = None;
  stop_time_update = [];
  timestamp = None;
  delay = None;
}

type position_mutable = {
  mutable latitude : float;
  mutable longitude : float;
  mutable bearing : float option;
  mutable odometer : float option;
  mutable speed : float option;
}

let default_position_mutable () : position_mutable = {
  latitude = 0.;
  longitude = 0.;
  bearing = None;
  odometer = None;
  speed = None;
}

type vehicle_position_mutable = {
  mutable trip : Gtfs_realtime_types.trip_descriptor option;
  mutable vehicle : Gtfs_realtime_types.vehicle_descriptor option;
  mutable position : Gtfs_realtime_types.position option;
  mutable current_stop_sequence : int32 option;
  mutable stop_id : string option;
  mutable current_status : Gtfs_realtime_types.vehicle_position_vehicle_stop_status option;
  mutable timestamp : int64 option;
  mutable congestion_level : Gtfs_realtime_types.vehicle_position_congestion_level option;
  mutable occupancy_status : Gtfs_realtime_types.vehicle_position_occupancy_status option;
}

let default_vehicle_position_mutable () : vehicle_position_mutable = {
  trip = None;
  vehicle = None;
  position = None;
  current_stop_sequence = None;
  stop_id = None;
  current_status = Some (Gtfs_realtime_types.default_vehicle_position_vehicle_stop_status ());
  timestamp = None;
  congestion_level = None;
  occupancy_status = None;
}

type time_range_mutable = {
  mutable start : int64 option;
  mutable end_ : int64 option;
}

let default_time_range_mutable () : time_range_mutable = {
  start = None;
  end_ = None;
}

type entity_selector_mutable = {
  mutable agency_id : string option;
  mutable route_id : string option;
  mutable route_type : int32 option;
  mutable trip : Gtfs_realtime_types.trip_descriptor option;
  mutable stop_id : string option;
}

let default_entity_selector_mutable () : entity_selector_mutable = {
  agency_id = None;
  route_id = None;
  route_type = None;
  trip = None;
  stop_id = None;
}

type translated_string_translation_mutable = {
  mutable text : string;
  mutable language : string option;
}

let default_translated_string_translation_mutable () : translated_string_translation_mutable = {
  text = "";
  language = None;
}

type translated_string_mutable = {
  mutable translation : Gtfs_realtime_types.translated_string_translation list;
}

let default_translated_string_mutable () : translated_string_mutable = {
  translation = [];
}

type alert_mutable = {
  mutable active_period : Gtfs_realtime_types.time_range list;
  mutable informed_entity : Gtfs_realtime_types.entity_selector list;
  mutable cause : Gtfs_realtime_types.alert_cause option;
  mutable effect : Gtfs_realtime_types.alert_effect option;
  mutable url : Gtfs_realtime_types.translated_string option;
  mutable header_text : Gtfs_realtime_types.translated_string option;
  mutable description_text : Gtfs_realtime_types.translated_string option;
}

let default_alert_mutable () : alert_mutable = {
  active_period = [];
  informed_entity = [];
  cause = Some (Gtfs_realtime_types.default_alert_cause ());
  effect = Some (Gtfs_realtime_types.default_alert_effect ());
  url = None;
  header_text = None;
  description_text = None;
}

type feed_entity_mutable = {
  mutable id : string;
  mutable is_deleted : bool option;
  mutable trip_update : Gtfs_realtime_types.trip_update option;
  mutable vehicle : Gtfs_realtime_types.vehicle_position option;
  mutable alert : Gtfs_realtime_types.alert option;
}

let default_feed_entity_mutable () : feed_entity_mutable = {
  id = "";
  is_deleted = Some (false);
  trip_update = None;
  vehicle = None;
  alert = None;
}

type feed_message_mutable = {
  mutable header : Gtfs_realtime_types.feed_header;
  mutable entity : Gtfs_realtime_types.feed_entity list;
}

let default_feed_message_mutable () : feed_message_mutable = {
  header = Gtfs_realtime_types.default_feed_header ();
  entity = [];
}


let rec decode_feed_header_incrementality d = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> (Gtfs_realtime_types.Full_dataset:Gtfs_realtime_types.feed_header_incrementality)
  | 1 -> (Gtfs_realtime_types.Differential:Gtfs_realtime_types.feed_header_incrementality)
  | _ -> Pbrt.Decoder.malformed_variant "feed_header_incrementality"

let rec decode_feed_header d =
  let v = default_feed_header_mutable () in
  let continue__= ref true in
  let gtfs_realtime_version_is_set = ref false in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.gtfs_realtime_version <- Pbrt.Decoder.string d; gtfs_realtime_version_is_set := true;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_header), field(1)" pk
    | Some (2, Pbrt.Varint) -> begin
      v.incrementality <- Some (decode_feed_header_incrementality d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_header), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.timestamp <- Some (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_header), field(3)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  begin if not !gtfs_realtime_version_is_set then Pbrt.Decoder.missing_field "gtfs_realtime_version" end;
  ({
    Gtfs_realtime_types.gtfs_realtime_version = v.gtfs_realtime_version;
    Gtfs_realtime_types.incrementality = v.incrementality;
    Gtfs_realtime_types.timestamp = v.timestamp;
  } : Gtfs_realtime_types.feed_header)

let rec decode_trip_descriptor_schedule_relationship d = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> (Gtfs_realtime_types.Scheduled:Gtfs_realtime_types.trip_descriptor_schedule_relationship)
  | 1 -> (Gtfs_realtime_types.Added:Gtfs_realtime_types.trip_descriptor_schedule_relationship)
  | 2 -> (Gtfs_realtime_types.Unscheduled:Gtfs_realtime_types.trip_descriptor_schedule_relationship)
  | 3 -> (Gtfs_realtime_types.Canceled:Gtfs_realtime_types.trip_descriptor_schedule_relationship)
  | _ -> Pbrt.Decoder.malformed_variant "trip_descriptor_schedule_relationship"

let rec decode_trip_descriptor d =
  let v = default_trip_descriptor_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.trip_id <- Some (Pbrt.Decoder.string d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_descriptor), field(1)" pk
    | Some (5, Pbrt.Bytes) -> begin
      v.route_id <- Some (Pbrt.Decoder.string d);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_descriptor), field(5)" pk
    | Some (6, Pbrt.Varint) -> begin
      v.direction_id <- Some (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_descriptor), field(6)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.start_time <- Some (Pbrt.Decoder.string d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_descriptor), field(2)" pk
    | Some (3, Pbrt.Bytes) -> begin
      v.start_date <- Some (Pbrt.Decoder.string d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_descriptor), field(3)" pk
    | Some (4, Pbrt.Varint) -> begin
      v.schedule_relationship <- Some (decode_trip_descriptor_schedule_relationship d);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_descriptor), field(4)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.trip_id = v.trip_id;
    Gtfs_realtime_types.route_id = v.route_id;
    Gtfs_realtime_types.direction_id = v.direction_id;
    Gtfs_realtime_types.start_time = v.start_time;
    Gtfs_realtime_types.start_date = v.start_date;
    Gtfs_realtime_types.schedule_relationship = v.schedule_relationship;
  } : Gtfs_realtime_types.trip_descriptor)

let rec decode_vehicle_descriptor d =
  let v = default_vehicle_descriptor_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.id <- Some (Pbrt.Decoder.string d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_descriptor), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.label <- Some (Pbrt.Decoder.string d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_descriptor), field(2)" pk
    | Some (3, Pbrt.Bytes) -> begin
      v.license_plate <- Some (Pbrt.Decoder.string d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_descriptor), field(3)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.id = v.id;
    Gtfs_realtime_types.label = v.label;
    Gtfs_realtime_types.license_plate = v.license_plate;
  } : Gtfs_realtime_types.vehicle_descriptor)

let rec decode_trip_update_stop_time_event d =
  let v = default_trip_update_stop_time_event_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      v.delay <- Some (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update_stop_time_event), field(1)" pk
    | Some (2, Pbrt.Varint) -> begin
      v.time <- Some (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update_stop_time_event), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.uncertainty <- Some (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update_stop_time_event), field(3)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.delay = v.delay;
    Gtfs_realtime_types.time = v.time;
    Gtfs_realtime_types.uncertainty = v.uncertainty;
  } : Gtfs_realtime_types.trip_update_stop_time_event)

let rec decode_trip_update_stop_time_update_schedule_relationship d = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> (Gtfs_realtime_types.Scheduled:Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship)
  | 1 -> (Gtfs_realtime_types.Skipped:Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship)
  | 2 -> (Gtfs_realtime_types.No_data:Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship)
  | _ -> Pbrt.Decoder.malformed_variant "trip_update_stop_time_update_schedule_relationship"

let rec decode_trip_update_stop_time_update d =
  let v = default_trip_update_stop_time_update_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      v.stop_sequence <- Some (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update_stop_time_update), field(1)" pk
    | Some (4, Pbrt.Bytes) -> begin
      v.stop_id <- Some (Pbrt.Decoder.string d);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update_stop_time_update), field(4)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.arrival <- Some (decode_trip_update_stop_time_event (Pbrt.Decoder.nested d));
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update_stop_time_update), field(2)" pk
    | Some (3, Pbrt.Bytes) -> begin
      v.departure <- Some (decode_trip_update_stop_time_event (Pbrt.Decoder.nested d));
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update_stop_time_update), field(3)" pk
    | Some (5, Pbrt.Varint) -> begin
      v.schedule_relationship <- Some (decode_trip_update_stop_time_update_schedule_relationship d);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update_stop_time_update), field(5)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.stop_sequence = v.stop_sequence;
    Gtfs_realtime_types.stop_id = v.stop_id;
    Gtfs_realtime_types.arrival = v.arrival;
    Gtfs_realtime_types.departure = v.departure;
    Gtfs_realtime_types.schedule_relationship = v.schedule_relationship;
  } : Gtfs_realtime_types.trip_update_stop_time_update)

let rec decode_trip_update d =
  let v = default_trip_update_mutable () in
  let continue__= ref true in
  let trip_is_set = ref false in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      v.stop_time_update <- List.rev v.stop_time_update;
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.trip <- decode_trip_descriptor (Pbrt.Decoder.nested d); trip_is_set := true;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update), field(1)" pk
    | Some (3, Pbrt.Bytes) -> begin
      v.vehicle <- Some (decode_vehicle_descriptor (Pbrt.Decoder.nested d));
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update), field(3)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.stop_time_update <- (decode_trip_update_stop_time_update (Pbrt.Decoder.nested d)) :: v.stop_time_update;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update), field(2)" pk
    | Some (4, Pbrt.Varint) -> begin
      v.timestamp <- Some (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update), field(4)" pk
    | Some (5, Pbrt.Varint) -> begin
      v.delay <- Some (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(trip_update), field(5)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  begin if not !trip_is_set then Pbrt.Decoder.missing_field "trip" end;
  ({
    Gtfs_realtime_types.trip = v.trip;
    Gtfs_realtime_types.vehicle = v.vehicle;
    Gtfs_realtime_types.stop_time_update = v.stop_time_update;
    Gtfs_realtime_types.timestamp = v.timestamp;
    Gtfs_realtime_types.delay = v.delay;
  } : Gtfs_realtime_types.trip_update)

let rec decode_position d =
  let v = default_position_mutable () in
  let continue__= ref true in
  let longitude_is_set = ref false in
  let latitude_is_set = ref false in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bits32) -> begin
      v.latitude <- Pbrt.Decoder.float_as_bits32 d; latitude_is_set := true;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(position), field(1)" pk
    | Some (2, Pbrt.Bits32) -> begin
      v.longitude <- Pbrt.Decoder.float_as_bits32 d; longitude_is_set := true;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(position), field(2)" pk
    | Some (3, Pbrt.Bits32) -> begin
      v.bearing <- Some (Pbrt.Decoder.float_as_bits32 d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(position), field(3)" pk
    | Some (4, Pbrt.Bits64) -> begin
      v.odometer <- Some (Pbrt.Decoder.float_as_bits64 d);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(position), field(4)" pk
    | Some (5, Pbrt.Bits32) -> begin
      v.speed <- Some (Pbrt.Decoder.float_as_bits32 d);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(position), field(5)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  begin if not !longitude_is_set then Pbrt.Decoder.missing_field "longitude" end;
  begin if not !latitude_is_set then Pbrt.Decoder.missing_field "latitude" end;
  ({
    Gtfs_realtime_types.latitude = v.latitude;
    Gtfs_realtime_types.longitude = v.longitude;
    Gtfs_realtime_types.bearing = v.bearing;
    Gtfs_realtime_types.odometer = v.odometer;
    Gtfs_realtime_types.speed = v.speed;
  } : Gtfs_realtime_types.position)

let rec decode_vehicle_position_vehicle_stop_status d = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> (Gtfs_realtime_types.Incoming_at:Gtfs_realtime_types.vehicle_position_vehicle_stop_status)
  | 1 -> (Gtfs_realtime_types.Stopped_at:Gtfs_realtime_types.vehicle_position_vehicle_stop_status)
  | 2 -> (Gtfs_realtime_types.In_transit_to:Gtfs_realtime_types.vehicle_position_vehicle_stop_status)
  | _ -> Pbrt.Decoder.malformed_variant "vehicle_position_vehicle_stop_status"

let rec decode_vehicle_position_congestion_level d = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> (Gtfs_realtime_types.Unknown_congestion_level:Gtfs_realtime_types.vehicle_position_congestion_level)
  | 1 -> (Gtfs_realtime_types.Running_smoothly:Gtfs_realtime_types.vehicle_position_congestion_level)
  | 2 -> (Gtfs_realtime_types.Stop_and_go:Gtfs_realtime_types.vehicle_position_congestion_level)
  | 3 -> (Gtfs_realtime_types.Congestion:Gtfs_realtime_types.vehicle_position_congestion_level)
  | 4 -> (Gtfs_realtime_types.Severe_congestion:Gtfs_realtime_types.vehicle_position_congestion_level)
  | _ -> Pbrt.Decoder.malformed_variant "vehicle_position_congestion_level"

let rec decode_vehicle_position_occupancy_status d = 
  match Pbrt.Decoder.int_as_varint d with
  | 0 -> (Gtfs_realtime_types.Empty:Gtfs_realtime_types.vehicle_position_occupancy_status)
  | 1 -> (Gtfs_realtime_types.Many_seats_available:Gtfs_realtime_types.vehicle_position_occupancy_status)
  | 2 -> (Gtfs_realtime_types.Few_seats_available:Gtfs_realtime_types.vehicle_position_occupancy_status)
  | 3 -> (Gtfs_realtime_types.Standing_room_only:Gtfs_realtime_types.vehicle_position_occupancy_status)
  | 4 -> (Gtfs_realtime_types.Crushed_standing_room_only:Gtfs_realtime_types.vehicle_position_occupancy_status)
  | 5 -> (Gtfs_realtime_types.Full:Gtfs_realtime_types.vehicle_position_occupancy_status)
  | 6 -> (Gtfs_realtime_types.Not_accepting_passengers:Gtfs_realtime_types.vehicle_position_occupancy_status)
  | _ -> Pbrt.Decoder.malformed_variant "vehicle_position_occupancy_status"

let rec decode_vehicle_position d =
  let v = default_vehicle_position_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.trip <- Some (decode_trip_descriptor (Pbrt.Decoder.nested d));
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(1)" pk
    | Some (8, Pbrt.Bytes) -> begin
      v.vehicle <- Some (decode_vehicle_descriptor (Pbrt.Decoder.nested d));
    end
    | Some (8, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(8)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.position <- Some (decode_position (Pbrt.Decoder.nested d));
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.current_stop_sequence <- Some (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(3)" pk
    | Some (7, Pbrt.Bytes) -> begin
      v.stop_id <- Some (Pbrt.Decoder.string d);
    end
    | Some (7, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(7)" pk
    | Some (4, Pbrt.Varint) -> begin
      v.current_status <- Some (decode_vehicle_position_vehicle_stop_status d);
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(4)" pk
    | Some (5, Pbrt.Varint) -> begin
      v.timestamp <- Some (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(5)" pk
    | Some (6, Pbrt.Varint) -> begin
      v.congestion_level <- Some (decode_vehicle_position_congestion_level d);
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(6)" pk
    | Some (9, Pbrt.Varint) -> begin
      v.occupancy_status <- Some (decode_vehicle_position_occupancy_status d);
    end
    | Some (9, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(vehicle_position), field(9)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.trip = v.trip;
    Gtfs_realtime_types.vehicle = v.vehicle;
    Gtfs_realtime_types.position = v.position;
    Gtfs_realtime_types.current_stop_sequence = v.current_stop_sequence;
    Gtfs_realtime_types.stop_id = v.stop_id;
    Gtfs_realtime_types.current_status = v.current_status;
    Gtfs_realtime_types.timestamp = v.timestamp;
    Gtfs_realtime_types.congestion_level = v.congestion_level;
    Gtfs_realtime_types.occupancy_status = v.occupancy_status;
  } : Gtfs_realtime_types.vehicle_position)

let rec decode_time_range d =
  let v = default_time_range_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Varint) -> begin
      v.start <- Some (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(time_range), field(1)" pk
    | Some (2, Pbrt.Varint) -> begin
      v.end_ <- Some (Pbrt.Decoder.int64_as_varint d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(time_range), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.start = v.start;
    Gtfs_realtime_types.end_ = v.end_;
  } : Gtfs_realtime_types.time_range)

let rec decode_entity_selector d =
  let v = default_entity_selector_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.agency_id <- Some (Pbrt.Decoder.string d);
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(entity_selector), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.route_id <- Some (Pbrt.Decoder.string d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(entity_selector), field(2)" pk
    | Some (3, Pbrt.Varint) -> begin
      v.route_type <- Some (Pbrt.Decoder.int32_as_varint d);
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(entity_selector), field(3)" pk
    | Some (4, Pbrt.Bytes) -> begin
      v.trip <- Some (decode_trip_descriptor (Pbrt.Decoder.nested d));
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(entity_selector), field(4)" pk
    | Some (5, Pbrt.Bytes) -> begin
      v.stop_id <- Some (Pbrt.Decoder.string d);
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(entity_selector), field(5)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.agency_id = v.agency_id;
    Gtfs_realtime_types.route_id = v.route_id;
    Gtfs_realtime_types.route_type = v.route_type;
    Gtfs_realtime_types.trip = v.trip;
    Gtfs_realtime_types.stop_id = v.stop_id;
  } : Gtfs_realtime_types.entity_selector)

let rec decode_alert_cause d = 
  match Pbrt.Decoder.int_as_varint d with
  | 1 -> (Gtfs_realtime_types.Unknown_cause:Gtfs_realtime_types.alert_cause)
  | 2 -> (Gtfs_realtime_types.Other_cause:Gtfs_realtime_types.alert_cause)
  | 3 -> (Gtfs_realtime_types.Technical_problem:Gtfs_realtime_types.alert_cause)
  | 4 -> (Gtfs_realtime_types.Strike:Gtfs_realtime_types.alert_cause)
  | 5 -> (Gtfs_realtime_types.Demonstration:Gtfs_realtime_types.alert_cause)
  | 6 -> (Gtfs_realtime_types.Accident:Gtfs_realtime_types.alert_cause)
  | 7 -> (Gtfs_realtime_types.Holiday:Gtfs_realtime_types.alert_cause)
  | 8 -> (Gtfs_realtime_types.Weather:Gtfs_realtime_types.alert_cause)
  | 9 -> (Gtfs_realtime_types.Maintenance:Gtfs_realtime_types.alert_cause)
  | 10 -> (Gtfs_realtime_types.Construction:Gtfs_realtime_types.alert_cause)
  | 11 -> (Gtfs_realtime_types.Police_activity:Gtfs_realtime_types.alert_cause)
  | 12 -> (Gtfs_realtime_types.Medical_emergency:Gtfs_realtime_types.alert_cause)
  | _ -> Pbrt.Decoder.malformed_variant "alert_cause"

let rec decode_alert_effect d = 
  match Pbrt.Decoder.int_as_varint d with
  | 1 -> (Gtfs_realtime_types.No_service:Gtfs_realtime_types.alert_effect)
  | 2 -> (Gtfs_realtime_types.Reduced_service:Gtfs_realtime_types.alert_effect)
  | 3 -> (Gtfs_realtime_types.Significant_delays:Gtfs_realtime_types.alert_effect)
  | 4 -> (Gtfs_realtime_types.Detour:Gtfs_realtime_types.alert_effect)
  | 5 -> (Gtfs_realtime_types.Additional_service:Gtfs_realtime_types.alert_effect)
  | 6 -> (Gtfs_realtime_types.Modified_service:Gtfs_realtime_types.alert_effect)
  | 7 -> (Gtfs_realtime_types.Other_effect:Gtfs_realtime_types.alert_effect)
  | 8 -> (Gtfs_realtime_types.Unknown_effect:Gtfs_realtime_types.alert_effect)
  | 9 -> (Gtfs_realtime_types.Stop_moved:Gtfs_realtime_types.alert_effect)
  | _ -> Pbrt.Decoder.malformed_variant "alert_effect"

let rec decode_translated_string_translation d =
  let v = default_translated_string_translation_mutable () in
  let continue__= ref true in
  let text_is_set = ref false in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.text <- Pbrt.Decoder.string d; text_is_set := true;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(translated_string_translation), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.language <- Some (Pbrt.Decoder.string d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(translated_string_translation), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  begin if not !text_is_set then Pbrt.Decoder.missing_field "text" end;
  ({
    Gtfs_realtime_types.text = v.text;
    Gtfs_realtime_types.language = v.language;
  } : Gtfs_realtime_types.translated_string_translation)

let rec decode_translated_string d =
  let v = default_translated_string_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      v.translation <- List.rev v.translation;
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.translation <- (decode_translated_string_translation (Pbrt.Decoder.nested d)) :: v.translation;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(translated_string), field(1)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.translation = v.translation;
  } : Gtfs_realtime_types.translated_string)

let rec decode_alert d =
  let v = default_alert_mutable () in
  let continue__= ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      v.informed_entity <- List.rev v.informed_entity;
      v.active_period <- List.rev v.active_period;
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.active_period <- (decode_time_range (Pbrt.Decoder.nested d)) :: v.active_period;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(alert), field(1)" pk
    | Some (5, Pbrt.Bytes) -> begin
      v.informed_entity <- (decode_entity_selector (Pbrt.Decoder.nested d)) :: v.informed_entity;
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(alert), field(5)" pk
    | Some (6, Pbrt.Varint) -> begin
      v.cause <- Some (decode_alert_cause d);
    end
    | Some (6, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(alert), field(6)" pk
    | Some (7, Pbrt.Varint) -> begin
      v.effect <- Some (decode_alert_effect d);
    end
    | Some (7, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(alert), field(7)" pk
    | Some (8, Pbrt.Bytes) -> begin
      v.url <- Some (decode_translated_string (Pbrt.Decoder.nested d));
    end
    | Some (8, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(alert), field(8)" pk
    | Some (10, Pbrt.Bytes) -> begin
      v.header_text <- Some (decode_translated_string (Pbrt.Decoder.nested d));
    end
    | Some (10, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(alert), field(10)" pk
    | Some (11, Pbrt.Bytes) -> begin
      v.description_text <- Some (decode_translated_string (Pbrt.Decoder.nested d));
    end
    | Some (11, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(alert), field(11)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({
    Gtfs_realtime_types.active_period = v.active_period;
    Gtfs_realtime_types.informed_entity = v.informed_entity;
    Gtfs_realtime_types.cause = v.cause;
    Gtfs_realtime_types.effect = v.effect;
    Gtfs_realtime_types.url = v.url;
    Gtfs_realtime_types.header_text = v.header_text;
    Gtfs_realtime_types.description_text = v.description_text;
  } : Gtfs_realtime_types.alert)

let rec decode_feed_entity d =
  let v = default_feed_entity_mutable () in
  let continue__= ref true in
  let id_is_set = ref false in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.id <- Pbrt.Decoder.string d; id_is_set := true;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_entity), field(1)" pk
    | Some (2, Pbrt.Varint) -> begin
      v.is_deleted <- Some (Pbrt.Decoder.bool d);
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_entity), field(2)" pk
    | Some (3, Pbrt.Bytes) -> begin
      v.trip_update <- Some (decode_trip_update (Pbrt.Decoder.nested d));
    end
    | Some (3, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_entity), field(3)" pk
    | Some (4, Pbrt.Bytes) -> begin
      v.vehicle <- Some (decode_vehicle_position (Pbrt.Decoder.nested d));
    end
    | Some (4, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_entity), field(4)" pk
    | Some (5, Pbrt.Bytes) -> begin
      v.alert <- Some (decode_alert (Pbrt.Decoder.nested d));
    end
    | Some (5, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_entity), field(5)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  begin if not !id_is_set then Pbrt.Decoder.missing_field "id" end;
  ({
    Gtfs_realtime_types.id = v.id;
    Gtfs_realtime_types.is_deleted = v.is_deleted;
    Gtfs_realtime_types.trip_update = v.trip_update;
    Gtfs_realtime_types.vehicle = v.vehicle;
    Gtfs_realtime_types.alert = v.alert;
  } : Gtfs_realtime_types.feed_entity)

let rec decode_feed_message d =
  let v = default_feed_message_mutable () in
  let continue__= ref true in
  let header_is_set = ref false in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None -> (
      v.entity <- List.rev v.entity;
    ); continue__ := false
    | Some (1, Pbrt.Bytes) -> begin
      v.header <- decode_feed_header (Pbrt.Decoder.nested d); header_is_set := true;
    end
    | Some (1, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_message), field(1)" pk
    | Some (2, Pbrt.Bytes) -> begin
      v.entity <- (decode_feed_entity (Pbrt.Decoder.nested d)) :: v.entity;
    end
    | Some (2, pk) -> 
      Pbrt.Decoder.unexpected_payload "Message(feed_message), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  begin if not !header_is_set then Pbrt.Decoder.missing_field "header" end;
  ({
    Gtfs_realtime_types.header = v.header;
    Gtfs_realtime_types.entity = v.entity;
  } : Gtfs_realtime_types.feed_message)

let rec encode_feed_header_incrementality (v:Gtfs_realtime_types.feed_header_incrementality) encoder =
  match v with
  | Gtfs_realtime_types.Full_dataset -> Pbrt.Encoder.int_as_varint (0) encoder
  | Gtfs_realtime_types.Differential -> Pbrt.Encoder.int_as_varint 1 encoder

let rec encode_feed_header (v:Gtfs_realtime_types.feed_header) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Gtfs_realtime_types.gtfs_realtime_version encoder;
  begin match v.Gtfs_realtime_types.incrementality with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Varint) encoder; 
    encode_feed_header_incrementality x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.timestamp with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int64_as_varint x encoder;
  | None -> ();
  end;
  ()

let rec encode_trip_descriptor_schedule_relationship (v:Gtfs_realtime_types.trip_descriptor_schedule_relationship) encoder =
  match v with
  | Gtfs_realtime_types.Scheduled -> Pbrt.Encoder.int_as_varint (0) encoder
  | Gtfs_realtime_types.Added -> Pbrt.Encoder.int_as_varint 1 encoder
  | Gtfs_realtime_types.Unscheduled -> Pbrt.Encoder.int_as_varint 2 encoder
  | Gtfs_realtime_types.Canceled -> Pbrt.Encoder.int_as_varint 3 encoder

let rec encode_trip_descriptor (v:Gtfs_realtime_types.trip_descriptor) encoder = 
  begin match v.Gtfs_realtime_types.trip_id with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.route_id with
  | Some x -> 
    Pbrt.Encoder.key (5, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.direction_id with
  | Some x -> 
    Pbrt.Encoder.key (6, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int32_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.start_time with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.start_date with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.schedule_relationship with
  | Some x -> 
    Pbrt.Encoder.key (4, Pbrt.Varint) encoder; 
    encode_trip_descriptor_schedule_relationship x encoder;
  | None -> ();
  end;
  ()

let rec encode_vehicle_descriptor (v:Gtfs_realtime_types.vehicle_descriptor) encoder = 
  begin match v.Gtfs_realtime_types.id with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.label with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.license_plate with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  ()

let rec encode_trip_update_stop_time_event (v:Gtfs_realtime_types.trip_update_stop_time_event) encoder = 
  begin match v.Gtfs_realtime_types.delay with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int32_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.time with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int64_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.uncertainty with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int32_as_varint x encoder;
  | None -> ();
  end;
  ()

let rec encode_trip_update_stop_time_update_schedule_relationship (v:Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship) encoder =
  match v with
  | Gtfs_realtime_types.Scheduled -> Pbrt.Encoder.int_as_varint (0) encoder
  | Gtfs_realtime_types.Skipped -> Pbrt.Encoder.int_as_varint 1 encoder
  | Gtfs_realtime_types.No_data -> Pbrt.Encoder.int_as_varint 2 encoder

let rec encode_trip_update_stop_time_update (v:Gtfs_realtime_types.trip_update_stop_time_update) encoder = 
  begin match v.Gtfs_realtime_types.stop_sequence with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int32_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.stop_id with
  | Some x -> 
    Pbrt.Encoder.key (4, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.arrival with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_trip_update_stop_time_event x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.departure with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_trip_update_stop_time_event x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.schedule_relationship with
  | Some x -> 
    Pbrt.Encoder.key (5, Pbrt.Varint) encoder; 
    encode_trip_update_stop_time_update_schedule_relationship x encoder;
  | None -> ();
  end;
  ()

let rec encode_trip_update (v:Gtfs_realtime_types.trip_update) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.nested (encode_trip_descriptor v.Gtfs_realtime_types.trip) encoder;
  begin match v.Gtfs_realtime_types.vehicle with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_vehicle_descriptor x) encoder;
  | None -> ();
  end;
  List.iter (fun x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_trip_update_stop_time_update x) encoder;
  ) v.Gtfs_realtime_types.stop_time_update;
  begin match v.Gtfs_realtime_types.timestamp with
  | Some x -> 
    Pbrt.Encoder.key (4, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int64_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.delay with
  | Some x -> 
    Pbrt.Encoder.key (5, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int32_as_varint x encoder;
  | None -> ();
  end;
  ()

let rec encode_position (v:Gtfs_realtime_types.position) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bits32) encoder; 
  Pbrt.Encoder.float_as_bits32 v.Gtfs_realtime_types.latitude encoder;
  Pbrt.Encoder.key (2, Pbrt.Bits32) encoder; 
  Pbrt.Encoder.float_as_bits32 v.Gtfs_realtime_types.longitude encoder;
  begin match v.Gtfs_realtime_types.bearing with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Bits32) encoder; 
    Pbrt.Encoder.float_as_bits32 x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.odometer with
  | Some x -> 
    Pbrt.Encoder.key (4, Pbrt.Bits64) encoder; 
    Pbrt.Encoder.float_as_bits64 x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.speed with
  | Some x -> 
    Pbrt.Encoder.key (5, Pbrt.Bits32) encoder; 
    Pbrt.Encoder.float_as_bits32 x encoder;
  | None -> ();
  end;
  ()

let rec encode_vehicle_position_vehicle_stop_status (v:Gtfs_realtime_types.vehicle_position_vehicle_stop_status) encoder =
  match v with
  | Gtfs_realtime_types.Incoming_at -> Pbrt.Encoder.int_as_varint (0) encoder
  | Gtfs_realtime_types.Stopped_at -> Pbrt.Encoder.int_as_varint 1 encoder
  | Gtfs_realtime_types.In_transit_to -> Pbrt.Encoder.int_as_varint 2 encoder

let rec encode_vehicle_position_congestion_level (v:Gtfs_realtime_types.vehicle_position_congestion_level) encoder =
  match v with
  | Gtfs_realtime_types.Unknown_congestion_level -> Pbrt.Encoder.int_as_varint (0) encoder
  | Gtfs_realtime_types.Running_smoothly -> Pbrt.Encoder.int_as_varint 1 encoder
  | Gtfs_realtime_types.Stop_and_go -> Pbrt.Encoder.int_as_varint 2 encoder
  | Gtfs_realtime_types.Congestion -> Pbrt.Encoder.int_as_varint 3 encoder
  | Gtfs_realtime_types.Severe_congestion -> Pbrt.Encoder.int_as_varint 4 encoder

let rec encode_vehicle_position_occupancy_status (v:Gtfs_realtime_types.vehicle_position_occupancy_status) encoder =
  match v with
  | Gtfs_realtime_types.Empty -> Pbrt.Encoder.int_as_varint (0) encoder
  | Gtfs_realtime_types.Many_seats_available -> Pbrt.Encoder.int_as_varint 1 encoder
  | Gtfs_realtime_types.Few_seats_available -> Pbrt.Encoder.int_as_varint 2 encoder
  | Gtfs_realtime_types.Standing_room_only -> Pbrt.Encoder.int_as_varint 3 encoder
  | Gtfs_realtime_types.Crushed_standing_room_only -> Pbrt.Encoder.int_as_varint 4 encoder
  | Gtfs_realtime_types.Full -> Pbrt.Encoder.int_as_varint 5 encoder
  | Gtfs_realtime_types.Not_accepting_passengers -> Pbrt.Encoder.int_as_varint 6 encoder

let rec encode_vehicle_position (v:Gtfs_realtime_types.vehicle_position) encoder = 
  begin match v.Gtfs_realtime_types.trip with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_trip_descriptor x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.vehicle with
  | Some x -> 
    Pbrt.Encoder.key (8, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_vehicle_descriptor x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.position with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_position x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.current_stop_sequence with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int32_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.stop_id with
  | Some x -> 
    Pbrt.Encoder.key (7, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.current_status with
  | Some x -> 
    Pbrt.Encoder.key (4, Pbrt.Varint) encoder; 
    encode_vehicle_position_vehicle_stop_status x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.timestamp with
  | Some x -> 
    Pbrt.Encoder.key (5, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int64_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.congestion_level with
  | Some x -> 
    Pbrt.Encoder.key (6, Pbrt.Varint) encoder; 
    encode_vehicle_position_congestion_level x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.occupancy_status with
  | Some x -> 
    Pbrt.Encoder.key (9, Pbrt.Varint) encoder; 
    encode_vehicle_position_occupancy_status x encoder;
  | None -> ();
  end;
  ()

let rec encode_time_range (v:Gtfs_realtime_types.time_range) encoder = 
  begin match v.Gtfs_realtime_types.start with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int64_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.end_ with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int64_as_varint x encoder;
  | None -> ();
  end;
  ()

let rec encode_entity_selector (v:Gtfs_realtime_types.entity_selector) encoder = 
  begin match v.Gtfs_realtime_types.agency_id with
  | Some x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.route_id with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.route_type with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Varint) encoder; 
    Pbrt.Encoder.int32_as_varint x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.trip with
  | Some x -> 
    Pbrt.Encoder.key (4, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_trip_descriptor x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.stop_id with
  | Some x -> 
    Pbrt.Encoder.key (5, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  ()

let rec encode_alert_cause (v:Gtfs_realtime_types.alert_cause) encoder =
  match v with
  | Gtfs_realtime_types.Unknown_cause -> Pbrt.Encoder.int_as_varint 1 encoder
  | Gtfs_realtime_types.Other_cause -> Pbrt.Encoder.int_as_varint 2 encoder
  | Gtfs_realtime_types.Technical_problem -> Pbrt.Encoder.int_as_varint 3 encoder
  | Gtfs_realtime_types.Strike -> Pbrt.Encoder.int_as_varint 4 encoder
  | Gtfs_realtime_types.Demonstration -> Pbrt.Encoder.int_as_varint 5 encoder
  | Gtfs_realtime_types.Accident -> Pbrt.Encoder.int_as_varint 6 encoder
  | Gtfs_realtime_types.Holiday -> Pbrt.Encoder.int_as_varint 7 encoder
  | Gtfs_realtime_types.Weather -> Pbrt.Encoder.int_as_varint 8 encoder
  | Gtfs_realtime_types.Maintenance -> Pbrt.Encoder.int_as_varint 9 encoder
  | Gtfs_realtime_types.Construction -> Pbrt.Encoder.int_as_varint 10 encoder
  | Gtfs_realtime_types.Police_activity -> Pbrt.Encoder.int_as_varint 11 encoder
  | Gtfs_realtime_types.Medical_emergency -> Pbrt.Encoder.int_as_varint 12 encoder

let rec encode_alert_effect (v:Gtfs_realtime_types.alert_effect) encoder =
  match v with
  | Gtfs_realtime_types.No_service -> Pbrt.Encoder.int_as_varint 1 encoder
  | Gtfs_realtime_types.Reduced_service -> Pbrt.Encoder.int_as_varint 2 encoder
  | Gtfs_realtime_types.Significant_delays -> Pbrt.Encoder.int_as_varint 3 encoder
  | Gtfs_realtime_types.Detour -> Pbrt.Encoder.int_as_varint 4 encoder
  | Gtfs_realtime_types.Additional_service -> Pbrt.Encoder.int_as_varint 5 encoder
  | Gtfs_realtime_types.Modified_service -> Pbrt.Encoder.int_as_varint 6 encoder
  | Gtfs_realtime_types.Other_effect -> Pbrt.Encoder.int_as_varint 7 encoder
  | Gtfs_realtime_types.Unknown_effect -> Pbrt.Encoder.int_as_varint 8 encoder
  | Gtfs_realtime_types.Stop_moved -> Pbrt.Encoder.int_as_varint 9 encoder

let rec encode_translated_string_translation (v:Gtfs_realtime_types.translated_string_translation) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Gtfs_realtime_types.text encoder;
  begin match v.Gtfs_realtime_types.language with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.string x encoder;
  | None -> ();
  end;
  ()

let rec encode_translated_string (v:Gtfs_realtime_types.translated_string) encoder = 
  List.iter (fun x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_translated_string_translation x) encoder;
  ) v.Gtfs_realtime_types.translation;
  ()

let rec encode_alert (v:Gtfs_realtime_types.alert) encoder = 
  List.iter (fun x -> 
    Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_time_range x) encoder;
  ) v.Gtfs_realtime_types.active_period;
  List.iter (fun x -> 
    Pbrt.Encoder.key (5, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_entity_selector x) encoder;
  ) v.Gtfs_realtime_types.informed_entity;
  begin match v.Gtfs_realtime_types.cause with
  | Some x -> 
    Pbrt.Encoder.key (6, Pbrt.Varint) encoder; 
    encode_alert_cause x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.effect with
  | Some x -> 
    Pbrt.Encoder.key (7, Pbrt.Varint) encoder; 
    encode_alert_effect x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.url with
  | Some x -> 
    Pbrt.Encoder.key (8, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_translated_string x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.header_text with
  | Some x -> 
    Pbrt.Encoder.key (10, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_translated_string x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.description_text with
  | Some x -> 
    Pbrt.Encoder.key (11, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_translated_string x) encoder;
  | None -> ();
  end;
  ()

let rec encode_feed_entity (v:Gtfs_realtime_types.feed_entity) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.string v.Gtfs_realtime_types.id encoder;
  begin match v.Gtfs_realtime_types.is_deleted with
  | Some x -> 
    Pbrt.Encoder.key (2, Pbrt.Varint) encoder; 
    Pbrt.Encoder.bool x encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.trip_update with
  | Some x -> 
    Pbrt.Encoder.key (3, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_trip_update x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.vehicle with
  | Some x -> 
    Pbrt.Encoder.key (4, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_vehicle_position x) encoder;
  | None -> ();
  end;
  begin match v.Gtfs_realtime_types.alert with
  | Some x -> 
    Pbrt.Encoder.key (5, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_alert x) encoder;
  | None -> ();
  end;
  ()

let rec encode_feed_message (v:Gtfs_realtime_types.feed_message) encoder = 
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder; 
  Pbrt.Encoder.nested (encode_feed_header v.Gtfs_realtime_types.header) encoder;
  List.iter (fun x -> 
    Pbrt.Encoder.key (2, Pbrt.Bytes) encoder; 
    Pbrt.Encoder.nested (encode_feed_entity x) encoder;
  ) v.Gtfs_realtime_types.entity;
  ()
