[@@@ocaml.warning "-27-30-39"]


type feed_header_incrementality =
  | Full_dataset 
  | Differential 

type feed_header = {
  gtfs_realtime_version : string;
  incrementality : feed_header_incrementality option;
  timestamp : int64 option;
}

type trip_descriptor_schedule_relationship =
  | Scheduled 
  | Added 
  | Unscheduled 
  | Canceled 

type trip_descriptor = {
  trip_id : string option;
  route_id : string option;
  direction_id : int32 option;
  start_time : string option;
  start_date : string option;
  schedule_relationship : trip_descriptor_schedule_relationship option;
}

type vehicle_descriptor = {
  id : string option;
  label : string option;
  license_plate : string option;
}

type trip_update_stop_time_event = {
  delay : int32 option;
  time : int64 option;
  uncertainty : int32 option;
}

type trip_update_stop_time_update_schedule_relationship =
  | Scheduled 
  | Skipped 
  | No_data 

type trip_update_stop_time_update = {
  stop_sequence : int32 option;
  stop_id : string option;
  arrival : trip_update_stop_time_event option;
  departure : trip_update_stop_time_event option;
  schedule_relationship : trip_update_stop_time_update_schedule_relationship option;
}

type trip_update = {
  trip : trip_descriptor;
  vehicle : vehicle_descriptor option;
  stop_time_update : trip_update_stop_time_update list;
  timestamp : int64 option;
  delay : int32 option;
}

type position = {
  latitude : float;
  longitude : float;
  bearing : float option;
  odometer : float option;
  speed : float option;
}

type vehicle_position_vehicle_stop_status =
  | Incoming_at 
  | Stopped_at 
  | In_transit_to 

type vehicle_position_congestion_level =
  | Unknown_congestion_level 
  | Running_smoothly 
  | Stop_and_go 
  | Congestion 
  | Severe_congestion 

type vehicle_position_occupancy_status =
  | Empty 
  | Many_seats_available 
  | Few_seats_available 
  | Standing_room_only 
  | Crushed_standing_room_only 
  | Full 
  | Not_accepting_passengers 

type vehicle_position = {
  trip : trip_descriptor option;
  vehicle : vehicle_descriptor option;
  position : position option;
  current_stop_sequence : int32 option;
  stop_id : string option;
  current_status : vehicle_position_vehicle_stop_status option;
  timestamp : int64 option;
  congestion_level : vehicle_position_congestion_level option;
  occupancy_status : vehicle_position_occupancy_status option;
}

type time_range = {
  start : int64 option;
  end_ : int64 option;
}

type entity_selector = {
  agency_id : string option;
  route_id : string option;
  route_type : int32 option;
  trip : trip_descriptor option;
  stop_id : string option;
}

type alert_cause =
  | Unknown_cause 
  | Other_cause 
  | Technical_problem 
  | Strike 
  | Demonstration 
  | Accident 
  | Holiday 
  | Weather 
  | Maintenance 
  | Construction 
  | Police_activity 
  | Medical_emergency 

type alert_effect =
  | No_service 
  | Reduced_service 
  | Significant_delays 
  | Detour 
  | Additional_service 
  | Modified_service 
  | Other_effect 
  | Unknown_effect 
  | Stop_moved 

type translated_string_translation = {
  text : string;
  language : string option;
}

type translated_string = {
  translation : translated_string_translation list;
}

type alert = {
  active_period : time_range list;
  informed_entity : entity_selector list;
  cause : alert_cause option;
  effect : alert_effect option;
  url : translated_string option;
  header_text : translated_string option;
  description_text : translated_string option;
}

type feed_entity = {
  id : string;
  is_deleted : bool option;
  trip_update : trip_update option;
  vehicle : vehicle_position option;
  alert : alert option;
}

type feed_message = {
  header : feed_header;
  entity : feed_entity list;
}

let rec default_feed_header_incrementality () = (Full_dataset:feed_header_incrementality)

let rec default_feed_header 
  ?gtfs_realtime_version:((gtfs_realtime_version:string) = "")
  ?incrementality:((incrementality:feed_header_incrementality option) = Some (default_feed_header_incrementality ()))
  ?timestamp:((timestamp:int64 option) = None)
  () : feed_header  = {
  gtfs_realtime_version;
  incrementality;
  timestamp;
}

let rec default_trip_descriptor_schedule_relationship () = (Scheduled:trip_descriptor_schedule_relationship)

let rec default_trip_descriptor 
  ?trip_id:((trip_id:string option) = None)
  ?route_id:((route_id:string option) = None)
  ?direction_id:((direction_id:int32 option) = None)
  ?start_time:((start_time:string option) = None)
  ?start_date:((start_date:string option) = None)
  ?schedule_relationship:((schedule_relationship:trip_descriptor_schedule_relationship option) = None)
  () : trip_descriptor  = {
  trip_id;
  route_id;
  direction_id;
  start_time;
  start_date;
  schedule_relationship;
}

let rec default_vehicle_descriptor 
  ?id:((id:string option) = None)
  ?label:((label:string option) = None)
  ?license_plate:((license_plate:string option) = None)
  () : vehicle_descriptor  = {
  id;
  label;
  license_plate;
}

let rec default_trip_update_stop_time_event 
  ?delay:((delay:int32 option) = None)
  ?time:((time:int64 option) = None)
  ?uncertainty:((uncertainty:int32 option) = None)
  () : trip_update_stop_time_event  = {
  delay;
  time;
  uncertainty;
}

let rec default_trip_update_stop_time_update_schedule_relationship () = (Scheduled:trip_update_stop_time_update_schedule_relationship)

let rec default_trip_update_stop_time_update 
  ?stop_sequence:((stop_sequence:int32 option) = None)
  ?stop_id:((stop_id:string option) = None)
  ?arrival:((arrival:trip_update_stop_time_event option) = None)
  ?departure:((departure:trip_update_stop_time_event option) = None)
  ?schedule_relationship:((schedule_relationship:trip_update_stop_time_update_schedule_relationship option) = Some (default_trip_update_stop_time_update_schedule_relationship ()))
  () : trip_update_stop_time_update  = {
  stop_sequence;
  stop_id;
  arrival;
  departure;
  schedule_relationship;
}

let rec default_trip_update 
  ?trip:((trip:trip_descriptor) = default_trip_descriptor ())
  ?vehicle:((vehicle:vehicle_descriptor option) = None)
  ?stop_time_update:((stop_time_update:trip_update_stop_time_update list) = [])
  ?timestamp:((timestamp:int64 option) = None)
  ?delay:((delay:int32 option) = None)
  () : trip_update  = {
  trip;
  vehicle;
  stop_time_update;
  timestamp;
  delay;
}

let rec default_position 
  ?latitude:((latitude:float) = 0.)
  ?longitude:((longitude:float) = 0.)
  ?bearing:((bearing:float option) = None)
  ?odometer:((odometer:float option) = None)
  ?speed:((speed:float option) = None)
  () : position  = {
  latitude;
  longitude;
  bearing;
  odometer;
  speed;
}

let rec default_vehicle_position_vehicle_stop_status () = (Incoming_at:vehicle_position_vehicle_stop_status)

let rec default_vehicle_position_congestion_level () = (Unknown_congestion_level:vehicle_position_congestion_level)

let rec default_vehicle_position_occupancy_status () = (Empty:vehicle_position_occupancy_status)

let rec default_vehicle_position 
  ?trip:((trip:trip_descriptor option) = None)
  ?vehicle:((vehicle:vehicle_descriptor option) = None)
  ?position:((position:position option) = None)
  ?current_stop_sequence:((current_stop_sequence:int32 option) = None)
  ?stop_id:((stop_id:string option) = None)
  ?current_status:((current_status:vehicle_position_vehicle_stop_status option) = Some (default_vehicle_position_vehicle_stop_status ()))
  ?timestamp:((timestamp:int64 option) = None)
  ?congestion_level:((congestion_level:vehicle_position_congestion_level option) = None)
  ?occupancy_status:((occupancy_status:vehicle_position_occupancy_status option) = None)
  () : vehicle_position  = {
  trip;
  vehicle;
  position;
  current_stop_sequence;
  stop_id;
  current_status;
  timestamp;
  congestion_level;
  occupancy_status;
}

let rec default_time_range 
  ?start:((start:int64 option) = None)
  ?end_:((end_:int64 option) = None)
  () : time_range  = {
  start;
  end_;
}

let rec default_entity_selector 
  ?agency_id:((agency_id:string option) = None)
  ?route_id:((route_id:string option) = None)
  ?route_type:((route_type:int32 option) = None)
  ?trip:((trip:trip_descriptor option) = None)
  ?stop_id:((stop_id:string option) = None)
  () : entity_selector  = {
  agency_id;
  route_id;
  route_type;
  trip;
  stop_id;
}

let rec default_alert_cause () = (Unknown_cause:alert_cause)

let rec default_alert_effect () = (No_service:alert_effect)

let rec default_translated_string_translation 
  ?text:((text:string) = "")
  ?language:((language:string option) = None)
  () : translated_string_translation  = {
  text;
  language;
}

let rec default_translated_string 
  ?translation:((translation:translated_string_translation list) = [])
  () : translated_string  = {
  translation;
}

let rec default_alert 
  ?active_period:((active_period:time_range list) = [])
  ?informed_entity:((informed_entity:entity_selector list) = [])
  ?cause:((cause:alert_cause option) = Some (default_alert_cause ()))
  ?effect:((effect:alert_effect option) = Some (default_alert_effect ()))
  ?url:((url:translated_string option) = None)
  ?header_text:((header_text:translated_string option) = None)
  ?description_text:((description_text:translated_string option) = None)
  () : alert  = {
  active_period;
  informed_entity;
  cause;
  effect;
  url;
  header_text;
  description_text;
}

let rec default_feed_entity 
  ?id:((id:string) = "")
  ?is_deleted:((is_deleted:bool option) = Some (false))
  ?trip_update:((trip_update:trip_update option) = None)
  ?vehicle:((vehicle:vehicle_position option) = None)
  ?alert:((alert:alert option) = None)
  () : feed_entity  = {
  id;
  is_deleted;
  trip_update;
  vehicle;
  alert;
}

let rec default_feed_message 
  ?header:((header:feed_header) = default_feed_header ())
  ?entity:((entity:feed_entity list) = [])
  () : feed_message  = {
  header;
  entity;
}
