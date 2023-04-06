(** nyct_subway.proto Pretty Printing *)

(** {2 Formatters} *)

(** [pp_trip_replacement_period v] formats v *)
val pp_trip_replacement_period
  :  Format.formatter
  -> Nyct_subway_types.trip_replacement_period
  -> unit

(** [pp_nyct_feed_header v] formats v *)
val pp_nyct_feed_header : Format.formatter -> Nyct_subway_types.nyct_feed_header -> unit

(** [pp_nyct_trip_descriptor_direction v] formats v *)
val pp_nyct_trip_descriptor_direction
  :  Format.formatter
  -> Nyct_subway_types.nyct_trip_descriptor_direction
  -> unit

(** [pp_nyct_trip_descriptor v] formats v *)
val pp_nyct_trip_descriptor
  :  Format.formatter
  -> Nyct_subway_types.nyct_trip_descriptor
  -> unit

(** [pp_nyct_stop_time_update v] formats v *)
val pp_nyct_stop_time_update
  :  Format.formatter
  -> Nyct_subway_types.nyct_stop_time_update
  -> unit
