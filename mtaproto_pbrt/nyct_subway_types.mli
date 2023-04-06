(** nyct_subway.proto Types *)

(** {2 Types} *)

type trip_replacement_period =
  { route_id : string option
  ; replacement_period : Gtfs_realtime_types.time_range option
  }

type nyct_feed_header =
  { nyct_subway_version : string
  ; trip_replacement_period : trip_replacement_period list
  }

type nyct_trip_descriptor_direction =
  | North
  | East
  | South
  | West

type nyct_trip_descriptor =
  { train_id : string option
  ; is_assigned : bool option
  ; direction : nyct_trip_descriptor_direction option
  }

type nyct_stop_time_update =
  { scheduled_track : string option
  ; actual_track : string option
  }

(** {2 Default values} *)

(** [default_trip_replacement_period ()] is the default value for type [trip_replacement_period] *)
val default_trip_replacement_period
  :  ?route_id:string option
  -> ?replacement_period:Gtfs_realtime_types.time_range option
  -> unit
  -> trip_replacement_period

(** [default_nyct_feed_header ()] is the default value for type [nyct_feed_header] *)
val default_nyct_feed_header
  :  ?nyct_subway_version:string
  -> ?trip_replacement_period:trip_replacement_period list
  -> unit
  -> nyct_feed_header

(** [default_nyct_trip_descriptor_direction ()] is the default value for type [nyct_trip_descriptor_direction] *)
val default_nyct_trip_descriptor_direction : unit -> nyct_trip_descriptor_direction

(** [default_nyct_trip_descriptor ()] is the default value for type [nyct_trip_descriptor] *)
val default_nyct_trip_descriptor
  :  ?train_id:string option
  -> ?is_assigned:bool option
  -> ?direction:nyct_trip_descriptor_direction option
  -> unit
  -> nyct_trip_descriptor

(** [default_nyct_stop_time_update ()] is the default value for type [nyct_stop_time_update] *)
val default_nyct_stop_time_update
  :  ?scheduled_track:string option
  -> ?actual_track:string option
  -> unit
  -> nyct_stop_time_update
