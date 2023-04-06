[@@@ocaml.warning "-27-30-39"]

let rec pp_feed_header_incrementality
  fmt
  (v : Gtfs_realtime_types.feed_header_incrementality)
  =
  match v with
  | Gtfs_realtime_types.Full_dataset -> Format.fprintf fmt "Full_dataset"
  | Gtfs_realtime_types.Differential -> Format.fprintf fmt "Differential"
;;

let rec pp_feed_header fmt (v : Gtfs_realtime_types.feed_header) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "gtfs_realtime_version"
      Pbrt.Pp.pp_string
      fmt
      v.Gtfs_realtime_types.gtfs_realtime_version;
    Pbrt.Pp.pp_record_field
      ~first:false
      "incrementality"
      (Pbrt.Pp.pp_option pp_feed_header_incrementality)
      fmt
      v.Gtfs_realtime_types.incrementality;
    Pbrt.Pp.pp_record_field
      ~first:false
      "timestamp"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64)
      fmt
      v.Gtfs_realtime_types.timestamp
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_trip_descriptor_schedule_relationship
  fmt
  (v : Gtfs_realtime_types.trip_descriptor_schedule_relationship)
  =
  match v with
  | Gtfs_realtime_types.Scheduled -> Format.fprintf fmt "Scheduled"
  | Gtfs_realtime_types.Added -> Format.fprintf fmt "Added"
  | Gtfs_realtime_types.Unscheduled -> Format.fprintf fmt "Unscheduled"
  | Gtfs_realtime_types.Canceled -> Format.fprintf fmt "Canceled"
;;

let rec pp_trip_descriptor fmt (v : Gtfs_realtime_types.trip_descriptor) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "trip_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.trip_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "route_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.route_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "direction_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32)
      fmt
      v.Gtfs_realtime_types.direction_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "start_time"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.start_time;
    Pbrt.Pp.pp_record_field
      ~first:false
      "start_date"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.start_date;
    Pbrt.Pp.pp_record_field
      ~first:false
      "schedule_relationship"
      (Pbrt.Pp.pp_option pp_trip_descriptor_schedule_relationship)
      fmt
      v.Gtfs_realtime_types.schedule_relationship
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_vehicle_descriptor fmt (v : Gtfs_realtime_types.vehicle_descriptor) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "label"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.label;
    Pbrt.Pp.pp_record_field
      ~first:false
      "license_plate"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.license_plate
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_trip_update_stop_time_event
  fmt
  (v : Gtfs_realtime_types.trip_update_stop_time_event)
  =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "delay"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32)
      fmt
      v.Gtfs_realtime_types.delay;
    Pbrt.Pp.pp_record_field
      ~first:false
      "time"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64)
      fmt
      v.Gtfs_realtime_types.time;
    Pbrt.Pp.pp_record_field
      ~first:false
      "uncertainty"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32)
      fmt
      v.Gtfs_realtime_types.uncertainty
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_trip_update_stop_time_update_schedule_relationship
  fmt
  (v : Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship)
  =
  match v with
  | Gtfs_realtime_types.Scheduled -> Format.fprintf fmt "Scheduled"
  | Gtfs_realtime_types.Skipped -> Format.fprintf fmt "Skipped"
  | Gtfs_realtime_types.No_data -> Format.fprintf fmt "No_data"
;;

let rec pp_trip_update_stop_time_update
  fmt
  (v : Gtfs_realtime_types.trip_update_stop_time_update)
  =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "stop_sequence"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32)
      fmt
      v.Gtfs_realtime_types.stop_sequence;
    Pbrt.Pp.pp_record_field
      ~first:false
      "stop_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.stop_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "arrival"
      (Pbrt.Pp.pp_option pp_trip_update_stop_time_event)
      fmt
      v.Gtfs_realtime_types.arrival;
    Pbrt.Pp.pp_record_field
      ~first:false
      "departure"
      (Pbrt.Pp.pp_option pp_trip_update_stop_time_event)
      fmt
      v.Gtfs_realtime_types.departure;
    Pbrt.Pp.pp_record_field
      ~first:false
      "schedule_relationship"
      (Pbrt.Pp.pp_option pp_trip_update_stop_time_update_schedule_relationship)
      fmt
      v.Gtfs_realtime_types.schedule_relationship
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_trip_update fmt (v : Gtfs_realtime_types.trip_update) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "trip"
      pp_trip_descriptor
      fmt
      v.Gtfs_realtime_types.trip;
    Pbrt.Pp.pp_record_field
      ~first:false
      "vehicle"
      (Pbrt.Pp.pp_option pp_vehicle_descriptor)
      fmt
      v.Gtfs_realtime_types.vehicle;
    Pbrt.Pp.pp_record_field
      ~first:false
      "stop_time_update"
      (Pbrt.Pp.pp_list pp_trip_update_stop_time_update)
      fmt
      v.Gtfs_realtime_types.stop_time_update;
    Pbrt.Pp.pp_record_field
      ~first:false
      "timestamp"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64)
      fmt
      v.Gtfs_realtime_types.timestamp;
    Pbrt.Pp.pp_record_field
      ~first:false
      "delay"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32)
      fmt
      v.Gtfs_realtime_types.delay
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_position fmt (v : Gtfs_realtime_types.position) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "latitude"
      Pbrt.Pp.pp_float
      fmt
      v.Gtfs_realtime_types.latitude;
    Pbrt.Pp.pp_record_field
      ~first:false
      "longitude"
      Pbrt.Pp.pp_float
      fmt
      v.Gtfs_realtime_types.longitude;
    Pbrt.Pp.pp_record_field
      ~first:false
      "bearing"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_float)
      fmt
      v.Gtfs_realtime_types.bearing;
    Pbrt.Pp.pp_record_field
      ~first:false
      "odometer"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_float)
      fmt
      v.Gtfs_realtime_types.odometer;
    Pbrt.Pp.pp_record_field
      ~first:false
      "speed"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_float)
      fmt
      v.Gtfs_realtime_types.speed
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_vehicle_position_vehicle_stop_status
  fmt
  (v : Gtfs_realtime_types.vehicle_position_vehicle_stop_status)
  =
  match v with
  | Gtfs_realtime_types.Incoming_at -> Format.fprintf fmt "Incoming_at"
  | Gtfs_realtime_types.Stopped_at -> Format.fprintf fmt "Stopped_at"
  | Gtfs_realtime_types.In_transit_to -> Format.fprintf fmt "In_transit_to"
;;

let rec pp_vehicle_position_congestion_level
  fmt
  (v : Gtfs_realtime_types.vehicle_position_congestion_level)
  =
  match v with
  | Gtfs_realtime_types.Unknown_congestion_level ->
    Format.fprintf fmt "Unknown_congestion_level"
  | Gtfs_realtime_types.Running_smoothly -> Format.fprintf fmt "Running_smoothly"
  | Gtfs_realtime_types.Stop_and_go -> Format.fprintf fmt "Stop_and_go"
  | Gtfs_realtime_types.Congestion -> Format.fprintf fmt "Congestion"
  | Gtfs_realtime_types.Severe_congestion -> Format.fprintf fmt "Severe_congestion"
;;

let rec pp_vehicle_position_occupancy_status
  fmt
  (v : Gtfs_realtime_types.vehicle_position_occupancy_status)
  =
  match v with
  | Gtfs_realtime_types.Empty -> Format.fprintf fmt "Empty"
  | Gtfs_realtime_types.Many_seats_available -> Format.fprintf fmt "Many_seats_available"
  | Gtfs_realtime_types.Few_seats_available -> Format.fprintf fmt "Few_seats_available"
  | Gtfs_realtime_types.Standing_room_only -> Format.fprintf fmt "Standing_room_only"
  | Gtfs_realtime_types.Crushed_standing_room_only ->
    Format.fprintf fmt "Crushed_standing_room_only"
  | Gtfs_realtime_types.Full -> Format.fprintf fmt "Full"
  | Gtfs_realtime_types.Not_accepting_passengers ->
    Format.fprintf fmt "Not_accepting_passengers"
;;

let rec pp_vehicle_position fmt (v : Gtfs_realtime_types.vehicle_position) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "trip"
      (Pbrt.Pp.pp_option pp_trip_descriptor)
      fmt
      v.Gtfs_realtime_types.trip;
    Pbrt.Pp.pp_record_field
      ~first:false
      "vehicle"
      (Pbrt.Pp.pp_option pp_vehicle_descriptor)
      fmt
      v.Gtfs_realtime_types.vehicle;
    Pbrt.Pp.pp_record_field
      ~first:false
      "position"
      (Pbrt.Pp.pp_option pp_position)
      fmt
      v.Gtfs_realtime_types.position;
    Pbrt.Pp.pp_record_field
      ~first:false
      "current_stop_sequence"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32)
      fmt
      v.Gtfs_realtime_types.current_stop_sequence;
    Pbrt.Pp.pp_record_field
      ~first:false
      "stop_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.stop_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "current_status"
      (Pbrt.Pp.pp_option pp_vehicle_position_vehicle_stop_status)
      fmt
      v.Gtfs_realtime_types.current_status;
    Pbrt.Pp.pp_record_field
      ~first:false
      "timestamp"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64)
      fmt
      v.Gtfs_realtime_types.timestamp;
    Pbrt.Pp.pp_record_field
      ~first:false
      "congestion_level"
      (Pbrt.Pp.pp_option pp_vehicle_position_congestion_level)
      fmt
      v.Gtfs_realtime_types.congestion_level;
    Pbrt.Pp.pp_record_field
      ~first:false
      "occupancy_status"
      (Pbrt.Pp.pp_option pp_vehicle_position_occupancy_status)
      fmt
      v.Gtfs_realtime_types.occupancy_status
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_time_range fmt (v : Gtfs_realtime_types.time_range) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "start"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64)
      fmt
      v.Gtfs_realtime_types.start;
    Pbrt.Pp.pp_record_field
      ~first:false
      "end_"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int64)
      fmt
      v.Gtfs_realtime_types.end_
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_entity_selector fmt (v : Gtfs_realtime_types.entity_selector) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "agency_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.agency_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "route_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.route_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "route_type"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_int32)
      fmt
      v.Gtfs_realtime_types.route_type;
    Pbrt.Pp.pp_record_field
      ~first:false
      "trip"
      (Pbrt.Pp.pp_option pp_trip_descriptor)
      fmt
      v.Gtfs_realtime_types.trip;
    Pbrt.Pp.pp_record_field
      ~first:false
      "stop_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.stop_id
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_alert_cause fmt (v : Gtfs_realtime_types.alert_cause) =
  match v with
  | Gtfs_realtime_types.Unknown_cause -> Format.fprintf fmt "Unknown_cause"
  | Gtfs_realtime_types.Other_cause -> Format.fprintf fmt "Other_cause"
  | Gtfs_realtime_types.Technical_problem -> Format.fprintf fmt "Technical_problem"
  | Gtfs_realtime_types.Strike -> Format.fprintf fmt "Strike"
  | Gtfs_realtime_types.Demonstration -> Format.fprintf fmt "Demonstration"
  | Gtfs_realtime_types.Accident -> Format.fprintf fmt "Accident"
  | Gtfs_realtime_types.Holiday -> Format.fprintf fmt "Holiday"
  | Gtfs_realtime_types.Weather -> Format.fprintf fmt "Weather"
  | Gtfs_realtime_types.Maintenance -> Format.fprintf fmt "Maintenance"
  | Gtfs_realtime_types.Construction -> Format.fprintf fmt "Construction"
  | Gtfs_realtime_types.Police_activity -> Format.fprintf fmt "Police_activity"
  | Gtfs_realtime_types.Medical_emergency -> Format.fprintf fmt "Medical_emergency"
;;

let rec pp_alert_effect fmt (v : Gtfs_realtime_types.alert_effect) =
  match v with
  | Gtfs_realtime_types.No_service -> Format.fprintf fmt "No_service"
  | Gtfs_realtime_types.Reduced_service -> Format.fprintf fmt "Reduced_service"
  | Gtfs_realtime_types.Significant_delays -> Format.fprintf fmt "Significant_delays"
  | Gtfs_realtime_types.Detour -> Format.fprintf fmt "Detour"
  | Gtfs_realtime_types.Additional_service -> Format.fprintf fmt "Additional_service"
  | Gtfs_realtime_types.Modified_service -> Format.fprintf fmt "Modified_service"
  | Gtfs_realtime_types.Other_effect -> Format.fprintf fmt "Other_effect"
  | Gtfs_realtime_types.Unknown_effect -> Format.fprintf fmt "Unknown_effect"
  | Gtfs_realtime_types.Stop_moved -> Format.fprintf fmt "Stop_moved"
;;

let rec pp_translated_string_translation
  fmt
  (v : Gtfs_realtime_types.translated_string_translation)
  =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "text"
      Pbrt.Pp.pp_string
      fmt
      v.Gtfs_realtime_types.text;
    Pbrt.Pp.pp_record_field
      ~first:false
      "language"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Gtfs_realtime_types.language
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_translated_string fmt (v : Gtfs_realtime_types.translated_string) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "translation"
      (Pbrt.Pp.pp_list pp_translated_string_translation)
      fmt
      v.Gtfs_realtime_types.translation
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_alert fmt (v : Gtfs_realtime_types.alert) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "active_period"
      (Pbrt.Pp.pp_list pp_time_range)
      fmt
      v.Gtfs_realtime_types.active_period;
    Pbrt.Pp.pp_record_field
      ~first:false
      "informed_entity"
      (Pbrt.Pp.pp_list pp_entity_selector)
      fmt
      v.Gtfs_realtime_types.informed_entity;
    Pbrt.Pp.pp_record_field
      ~first:false
      "cause"
      (Pbrt.Pp.pp_option pp_alert_cause)
      fmt
      v.Gtfs_realtime_types.cause;
    Pbrt.Pp.pp_record_field
      ~first:false
      "effect"
      (Pbrt.Pp.pp_option pp_alert_effect)
      fmt
      v.Gtfs_realtime_types.effect;
    Pbrt.Pp.pp_record_field
      ~first:false
      "url"
      (Pbrt.Pp.pp_option pp_translated_string)
      fmt
      v.Gtfs_realtime_types.url;
    Pbrt.Pp.pp_record_field
      ~first:false
      "header_text"
      (Pbrt.Pp.pp_option pp_translated_string)
      fmt
      v.Gtfs_realtime_types.header_text;
    Pbrt.Pp.pp_record_field
      ~first:false
      "description_text"
      (Pbrt.Pp.pp_option pp_translated_string)
      fmt
      v.Gtfs_realtime_types.description_text
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_feed_entity fmt (v : Gtfs_realtime_types.feed_entity) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "id"
      Pbrt.Pp.pp_string
      fmt
      v.Gtfs_realtime_types.id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "is_deleted"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool)
      fmt
      v.Gtfs_realtime_types.is_deleted;
    Pbrt.Pp.pp_record_field
      ~first:false
      "trip_update"
      (Pbrt.Pp.pp_option pp_trip_update)
      fmt
      v.Gtfs_realtime_types.trip_update;
    Pbrt.Pp.pp_record_field
      ~first:false
      "vehicle"
      (Pbrt.Pp.pp_option pp_vehicle_position)
      fmt
      v.Gtfs_realtime_types.vehicle;
    Pbrt.Pp.pp_record_field
      ~first:false
      "alert"
      (Pbrt.Pp.pp_option pp_alert)
      fmt
      v.Gtfs_realtime_types.alert
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_feed_message fmt (v : Gtfs_realtime_types.feed_message) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "header"
      pp_feed_header
      fmt
      v.Gtfs_realtime_types.header;
    Pbrt.Pp.pp_record_field
      ~first:false
      "entity"
      (Pbrt.Pp.pp_list pp_feed_entity)
      fmt
      v.Gtfs_realtime_types.entity
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;
