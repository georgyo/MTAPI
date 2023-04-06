(** gtfs_realtime.proto Pretty Printing *)

(** {2 Formatters} *)

(** [pp_feed_header_incrementality v] formats v *)
val pp_feed_header_incrementality
  :  Format.formatter
  -> Gtfs_realtime_types.feed_header_incrementality
  -> unit

(** [pp_feed_header v] formats v *)
val pp_feed_header : Format.formatter -> Gtfs_realtime_types.feed_header -> unit

(** [pp_trip_descriptor_schedule_relationship v] formats v *)
val pp_trip_descriptor_schedule_relationship
  :  Format.formatter
  -> Gtfs_realtime_types.trip_descriptor_schedule_relationship
  -> unit

(** [pp_trip_descriptor v] formats v *)
val pp_trip_descriptor : Format.formatter -> Gtfs_realtime_types.trip_descriptor -> unit

(** [pp_vehicle_descriptor v] formats v *)
val pp_vehicle_descriptor
  :  Format.formatter
  -> Gtfs_realtime_types.vehicle_descriptor
  -> unit

(** [pp_trip_update_stop_time_event v] formats v *)
val pp_trip_update_stop_time_event
  :  Format.formatter
  -> Gtfs_realtime_types.trip_update_stop_time_event
  -> unit

(** [pp_trip_update_stop_time_update_schedule_relationship v] formats v *)
val pp_trip_update_stop_time_update_schedule_relationship
  :  Format.formatter
  -> Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship
  -> unit

(** [pp_trip_update_stop_time_update v] formats v *)
val pp_trip_update_stop_time_update
  :  Format.formatter
  -> Gtfs_realtime_types.trip_update_stop_time_update
  -> unit

(** [pp_trip_update v] formats v *)
val pp_trip_update : Format.formatter -> Gtfs_realtime_types.trip_update -> unit

(** [pp_position v] formats v *)
val pp_position : Format.formatter -> Gtfs_realtime_types.position -> unit

(** [pp_vehicle_position_vehicle_stop_status v] formats v *)
val pp_vehicle_position_vehicle_stop_status
  :  Format.formatter
  -> Gtfs_realtime_types.vehicle_position_vehicle_stop_status
  -> unit

(** [pp_vehicle_position_congestion_level v] formats v *)
val pp_vehicle_position_congestion_level
  :  Format.formatter
  -> Gtfs_realtime_types.vehicle_position_congestion_level
  -> unit

(** [pp_vehicle_position_occupancy_status v] formats v *)
val pp_vehicle_position_occupancy_status
  :  Format.formatter
  -> Gtfs_realtime_types.vehicle_position_occupancy_status
  -> unit

(** [pp_vehicle_position v] formats v *)
val pp_vehicle_position : Format.formatter -> Gtfs_realtime_types.vehicle_position -> unit

(** [pp_time_range v] formats v *)
val pp_time_range : Format.formatter -> Gtfs_realtime_types.time_range -> unit

(** [pp_entity_selector v] formats v *)
val pp_entity_selector : Format.formatter -> Gtfs_realtime_types.entity_selector -> unit

(** [pp_alert_cause v] formats v *)
val pp_alert_cause : Format.formatter -> Gtfs_realtime_types.alert_cause -> unit

(** [pp_alert_effect v] formats v *)
val pp_alert_effect : Format.formatter -> Gtfs_realtime_types.alert_effect -> unit

(** [pp_translated_string_translation v] formats v *)
val pp_translated_string_translation
  :  Format.formatter
  -> Gtfs_realtime_types.translated_string_translation
  -> unit

(** [pp_translated_string v] formats v *)
val pp_translated_string
  :  Format.formatter
  -> Gtfs_realtime_types.translated_string
  -> unit

(** [pp_alert v] formats v *)
val pp_alert : Format.formatter -> Gtfs_realtime_types.alert -> unit

(** [pp_feed_entity v] formats v *)
val pp_feed_entity : Format.formatter -> Gtfs_realtime_types.feed_entity -> unit

(** [pp_feed_message v] formats v *)
val pp_feed_message : Format.formatter -> Gtfs_realtime_types.feed_message -> unit
