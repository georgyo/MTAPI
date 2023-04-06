(** gtfs_realtime.proto Types *)

(** {2 Types} *)

type feed_header_incrementality =
  | Full_dataset
  | Differential

type feed_header =
  { gtfs_realtime_version : string
  ; incrementality : feed_header_incrementality option
  ; timestamp : int64 option
  }

type trip_descriptor_schedule_relationship =
  | Scheduled
  | Added
  | Unscheduled
  | Canceled

type trip_descriptor =
  { trip_id : string option
  ; route_id : string option
  ; direction_id : int32 option
  ; start_time : string option
  ; start_date : string option
  ; schedule_relationship : trip_descriptor_schedule_relationship option
  }

type vehicle_descriptor =
  { id : string option
  ; label : string option
  ; license_plate : string option
  }

type trip_update_stop_time_event =
  { delay : int32 option
  ; time : int64 option
  ; uncertainty : int32 option
  }

type trip_update_stop_time_update_schedule_relationship =
  | Scheduled
  | Skipped
  | No_data

type trip_update_stop_time_update =
  { stop_sequence : int32 option
  ; stop_id : string option
  ; arrival : trip_update_stop_time_event option
  ; departure : trip_update_stop_time_event option
  ; schedule_relationship : trip_update_stop_time_update_schedule_relationship option
  }

type trip_update =
  { trip : trip_descriptor
  ; vehicle : vehicle_descriptor option
  ; stop_time_update : trip_update_stop_time_update list
  ; timestamp : int64 option
  ; delay : int32 option
  }

type position =
  { latitude : float
  ; longitude : float
  ; bearing : float option
  ; odometer : float option
  ; speed : float option
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

type vehicle_position =
  { trip : trip_descriptor option
  ; vehicle : vehicle_descriptor option
  ; position : position option
  ; current_stop_sequence : int32 option
  ; stop_id : string option
  ; current_status : vehicle_position_vehicle_stop_status option
  ; timestamp : int64 option
  ; congestion_level : vehicle_position_congestion_level option
  ; occupancy_status : vehicle_position_occupancy_status option
  }

type time_range =
  { start : int64 option
  ; end_ : int64 option
  }

type entity_selector =
  { agency_id : string option
  ; route_id : string option
  ; route_type : int32 option
  ; trip : trip_descriptor option
  ; stop_id : string option
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

type translated_string_translation =
  { text : string
  ; language : string option
  }

type translated_string = { translation : translated_string_translation list }

type alert =
  { active_period : time_range list
  ; informed_entity : entity_selector list
  ; cause : alert_cause option
  ; effect : alert_effect option
  ; url : translated_string option
  ; header_text : translated_string option
  ; description_text : translated_string option
  }

type feed_entity =
  { id : string
  ; is_deleted : bool option
  ; trip_update : trip_update option
  ; vehicle : vehicle_position option
  ; alert : alert option
  }

type feed_message =
  { header : feed_header
  ; entity : feed_entity list
  }

(** {2 Default values} *)

(** [default_feed_header_incrementality ()] is the default value for type [feed_header_incrementality] *)
val default_feed_header_incrementality : unit -> feed_header_incrementality

(** [default_feed_header ()] is the default value for type [feed_header] *)
val default_feed_header
  :  ?gtfs_realtime_version:string
  -> ?incrementality:feed_header_incrementality option
  -> ?timestamp:int64 option
  -> unit
  -> feed_header

(** [default_trip_descriptor_schedule_relationship ()] is the default value for type [trip_descriptor_schedule_relationship] *)
val default_trip_descriptor_schedule_relationship
  :  unit
  -> trip_descriptor_schedule_relationship

(** [default_trip_descriptor ()] is the default value for type [trip_descriptor] *)
val default_trip_descriptor
  :  ?trip_id:string option
  -> ?route_id:string option
  -> ?direction_id:int32 option
  -> ?start_time:string option
  -> ?start_date:string option
  -> ?schedule_relationship:trip_descriptor_schedule_relationship option
  -> unit
  -> trip_descriptor

(** [default_vehicle_descriptor ()] is the default value for type [vehicle_descriptor] *)
val default_vehicle_descriptor
  :  ?id:string option
  -> ?label:string option
  -> ?license_plate:string option
  -> unit
  -> vehicle_descriptor

(** [default_trip_update_stop_time_event ()] is the default value for type [trip_update_stop_time_event] *)
val default_trip_update_stop_time_event
  :  ?delay:int32 option
  -> ?time:int64 option
  -> ?uncertainty:int32 option
  -> unit
  -> trip_update_stop_time_event

(** [default_trip_update_stop_time_update_schedule_relationship ()] is the default value for type [trip_update_stop_time_update_schedule_relationship] *)
val default_trip_update_stop_time_update_schedule_relationship
  :  unit
  -> trip_update_stop_time_update_schedule_relationship

(** [default_trip_update_stop_time_update ()] is the default value for type [trip_update_stop_time_update] *)
val default_trip_update_stop_time_update
  :  ?stop_sequence:int32 option
  -> ?stop_id:string option
  -> ?arrival:trip_update_stop_time_event option
  -> ?departure:trip_update_stop_time_event option
  -> ?schedule_relationship:trip_update_stop_time_update_schedule_relationship option
  -> unit
  -> trip_update_stop_time_update

(** [default_trip_update ()] is the default value for type [trip_update] *)
val default_trip_update
  :  ?trip:trip_descriptor
  -> ?vehicle:vehicle_descriptor option
  -> ?stop_time_update:trip_update_stop_time_update list
  -> ?timestamp:int64 option
  -> ?delay:int32 option
  -> unit
  -> trip_update

(** [default_position ()] is the default value for type [position] *)
val default_position
  :  ?latitude:float
  -> ?longitude:float
  -> ?bearing:float option
  -> ?odometer:float option
  -> ?speed:float option
  -> unit
  -> position

(** [default_vehicle_position_vehicle_stop_status ()] is the default value for type [vehicle_position_vehicle_stop_status] *)
val default_vehicle_position_vehicle_stop_status
  :  unit
  -> vehicle_position_vehicle_stop_status

(** [default_vehicle_position_congestion_level ()] is the default value for type [vehicle_position_congestion_level] *)
val default_vehicle_position_congestion_level : unit -> vehicle_position_congestion_level

(** [default_vehicle_position_occupancy_status ()] is the default value for type [vehicle_position_occupancy_status] *)
val default_vehicle_position_occupancy_status : unit -> vehicle_position_occupancy_status

(** [default_vehicle_position ()] is the default value for type [vehicle_position] *)
val default_vehicle_position
  :  ?trip:trip_descriptor option
  -> ?vehicle:vehicle_descriptor option
  -> ?position:position option
  -> ?current_stop_sequence:int32 option
  -> ?stop_id:string option
  -> ?current_status:vehicle_position_vehicle_stop_status option
  -> ?timestamp:int64 option
  -> ?congestion_level:vehicle_position_congestion_level option
  -> ?occupancy_status:vehicle_position_occupancy_status option
  -> unit
  -> vehicle_position

(** [default_time_range ()] is the default value for type [time_range] *)
val default_time_range : ?start:int64 option -> ?end_:int64 option -> unit -> time_range

(** [default_entity_selector ()] is the default value for type [entity_selector] *)
val default_entity_selector
  :  ?agency_id:string option
  -> ?route_id:string option
  -> ?route_type:int32 option
  -> ?trip:trip_descriptor option
  -> ?stop_id:string option
  -> unit
  -> entity_selector

(** [default_alert_cause ()] is the default value for type [alert_cause] *)
val default_alert_cause : unit -> alert_cause

(** [default_alert_effect ()] is the default value for type [alert_effect] *)
val default_alert_effect : unit -> alert_effect

(** [default_translated_string_translation ()] is the default value for type [translated_string_translation] *)
val default_translated_string_translation
  :  ?text:string
  -> ?language:string option
  -> unit
  -> translated_string_translation

(** [default_translated_string ()] is the default value for type [translated_string] *)
val default_translated_string
  :  ?translation:translated_string_translation list
  -> unit
  -> translated_string

(** [default_alert ()] is the default value for type [alert] *)
val default_alert
  :  ?active_period:time_range list
  -> ?informed_entity:entity_selector list
  -> ?cause:alert_cause option
  -> ?effect:alert_effect option
  -> ?url:translated_string option
  -> ?header_text:translated_string option
  -> ?description_text:translated_string option
  -> unit
  -> alert

(** [default_feed_entity ()] is the default value for type [feed_entity] *)
val default_feed_entity
  :  ?id:string
  -> ?is_deleted:bool option
  -> ?trip_update:trip_update option
  -> ?vehicle:vehicle_position option
  -> ?alert:alert option
  -> unit
  -> feed_entity

(** [default_feed_message ()] is the default value for type [feed_message] *)
val default_feed_message
  :  ?header:feed_header
  -> ?entity:feed_entity list
  -> unit
  -> feed_message
