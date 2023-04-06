(** gtfs_realtime.proto Binary Encoding *)


(** {2 Protobuf Encoding} *)

val encode_feed_header_incrementality : Gtfs_realtime_types.feed_header_incrementality -> Pbrt.Encoder.t -> unit
(** [encode_feed_header_incrementality v encoder] encodes [v] with the given [encoder] *)

val encode_feed_header : Gtfs_realtime_types.feed_header -> Pbrt.Encoder.t -> unit
(** [encode_feed_header v encoder] encodes [v] with the given [encoder] *)

val encode_trip_descriptor_schedule_relationship : Gtfs_realtime_types.trip_descriptor_schedule_relationship -> Pbrt.Encoder.t -> unit
(** [encode_trip_descriptor_schedule_relationship v encoder] encodes [v] with the given [encoder] *)

val encode_trip_descriptor : Gtfs_realtime_types.trip_descriptor -> Pbrt.Encoder.t -> unit
(** [encode_trip_descriptor v encoder] encodes [v] with the given [encoder] *)

val encode_vehicle_descriptor : Gtfs_realtime_types.vehicle_descriptor -> Pbrt.Encoder.t -> unit
(** [encode_vehicle_descriptor v encoder] encodes [v] with the given [encoder] *)

val encode_trip_update_stop_time_event : Gtfs_realtime_types.trip_update_stop_time_event -> Pbrt.Encoder.t -> unit
(** [encode_trip_update_stop_time_event v encoder] encodes [v] with the given [encoder] *)

val encode_trip_update_stop_time_update_schedule_relationship : Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship -> Pbrt.Encoder.t -> unit
(** [encode_trip_update_stop_time_update_schedule_relationship v encoder] encodes [v] with the given [encoder] *)

val encode_trip_update_stop_time_update : Gtfs_realtime_types.trip_update_stop_time_update -> Pbrt.Encoder.t -> unit
(** [encode_trip_update_stop_time_update v encoder] encodes [v] with the given [encoder] *)

val encode_trip_update : Gtfs_realtime_types.trip_update -> Pbrt.Encoder.t -> unit
(** [encode_trip_update v encoder] encodes [v] with the given [encoder] *)

val encode_position : Gtfs_realtime_types.position -> Pbrt.Encoder.t -> unit
(** [encode_position v encoder] encodes [v] with the given [encoder] *)

val encode_vehicle_position_vehicle_stop_status : Gtfs_realtime_types.vehicle_position_vehicle_stop_status -> Pbrt.Encoder.t -> unit
(** [encode_vehicle_position_vehicle_stop_status v encoder] encodes [v] with the given [encoder] *)

val encode_vehicle_position_congestion_level : Gtfs_realtime_types.vehicle_position_congestion_level -> Pbrt.Encoder.t -> unit
(** [encode_vehicle_position_congestion_level v encoder] encodes [v] with the given [encoder] *)

val encode_vehicle_position_occupancy_status : Gtfs_realtime_types.vehicle_position_occupancy_status -> Pbrt.Encoder.t -> unit
(** [encode_vehicle_position_occupancy_status v encoder] encodes [v] with the given [encoder] *)

val encode_vehicle_position : Gtfs_realtime_types.vehicle_position -> Pbrt.Encoder.t -> unit
(** [encode_vehicle_position v encoder] encodes [v] with the given [encoder] *)

val encode_time_range : Gtfs_realtime_types.time_range -> Pbrt.Encoder.t -> unit
(** [encode_time_range v encoder] encodes [v] with the given [encoder] *)

val encode_entity_selector : Gtfs_realtime_types.entity_selector -> Pbrt.Encoder.t -> unit
(** [encode_entity_selector v encoder] encodes [v] with the given [encoder] *)

val encode_alert_cause : Gtfs_realtime_types.alert_cause -> Pbrt.Encoder.t -> unit
(** [encode_alert_cause v encoder] encodes [v] with the given [encoder] *)

val encode_alert_effect : Gtfs_realtime_types.alert_effect -> Pbrt.Encoder.t -> unit
(** [encode_alert_effect v encoder] encodes [v] with the given [encoder] *)

val encode_translated_string_translation : Gtfs_realtime_types.translated_string_translation -> Pbrt.Encoder.t -> unit
(** [encode_translated_string_translation v encoder] encodes [v] with the given [encoder] *)

val encode_translated_string : Gtfs_realtime_types.translated_string -> Pbrt.Encoder.t -> unit
(** [encode_translated_string v encoder] encodes [v] with the given [encoder] *)

val encode_alert : Gtfs_realtime_types.alert -> Pbrt.Encoder.t -> unit
(** [encode_alert v encoder] encodes [v] with the given [encoder] *)

val encode_feed_entity : Gtfs_realtime_types.feed_entity -> Pbrt.Encoder.t -> unit
(** [encode_feed_entity v encoder] encodes [v] with the given [encoder] *)

val encode_feed_message : Gtfs_realtime_types.feed_message -> Pbrt.Encoder.t -> unit
(** [encode_feed_message v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_feed_header_incrementality : Pbrt.Decoder.t -> Gtfs_realtime_types.feed_header_incrementality
(** [decode_feed_header_incrementality decoder] decodes a [feed_header_incrementality] value from [decoder] *)

val decode_feed_header : Pbrt.Decoder.t -> Gtfs_realtime_types.feed_header
(** [decode_feed_header decoder] decodes a [feed_header] value from [decoder] *)

val decode_trip_descriptor_schedule_relationship : Pbrt.Decoder.t -> Gtfs_realtime_types.trip_descriptor_schedule_relationship
(** [decode_trip_descriptor_schedule_relationship decoder] decodes a [trip_descriptor_schedule_relationship] value from [decoder] *)

val decode_trip_descriptor : Pbrt.Decoder.t -> Gtfs_realtime_types.trip_descriptor
(** [decode_trip_descriptor decoder] decodes a [trip_descriptor] value from [decoder] *)

val decode_vehicle_descriptor : Pbrt.Decoder.t -> Gtfs_realtime_types.vehicle_descriptor
(** [decode_vehicle_descriptor decoder] decodes a [vehicle_descriptor] value from [decoder] *)

val decode_trip_update_stop_time_event : Pbrt.Decoder.t -> Gtfs_realtime_types.trip_update_stop_time_event
(** [decode_trip_update_stop_time_event decoder] decodes a [trip_update_stop_time_event] value from [decoder] *)

val decode_trip_update_stop_time_update_schedule_relationship : Pbrt.Decoder.t -> Gtfs_realtime_types.trip_update_stop_time_update_schedule_relationship
(** [decode_trip_update_stop_time_update_schedule_relationship decoder] decodes a [trip_update_stop_time_update_schedule_relationship] value from [decoder] *)

val decode_trip_update_stop_time_update : Pbrt.Decoder.t -> Gtfs_realtime_types.trip_update_stop_time_update
(** [decode_trip_update_stop_time_update decoder] decodes a [trip_update_stop_time_update] value from [decoder] *)

val decode_trip_update : Pbrt.Decoder.t -> Gtfs_realtime_types.trip_update
(** [decode_trip_update decoder] decodes a [trip_update] value from [decoder] *)

val decode_position : Pbrt.Decoder.t -> Gtfs_realtime_types.position
(** [decode_position decoder] decodes a [position] value from [decoder] *)

val decode_vehicle_position_vehicle_stop_status : Pbrt.Decoder.t -> Gtfs_realtime_types.vehicle_position_vehicle_stop_status
(** [decode_vehicle_position_vehicle_stop_status decoder] decodes a [vehicle_position_vehicle_stop_status] value from [decoder] *)

val decode_vehicle_position_congestion_level : Pbrt.Decoder.t -> Gtfs_realtime_types.vehicle_position_congestion_level
(** [decode_vehicle_position_congestion_level decoder] decodes a [vehicle_position_congestion_level] value from [decoder] *)

val decode_vehicle_position_occupancy_status : Pbrt.Decoder.t -> Gtfs_realtime_types.vehicle_position_occupancy_status
(** [decode_vehicle_position_occupancy_status decoder] decodes a [vehicle_position_occupancy_status] value from [decoder] *)

val decode_vehicle_position : Pbrt.Decoder.t -> Gtfs_realtime_types.vehicle_position
(** [decode_vehicle_position decoder] decodes a [vehicle_position] value from [decoder] *)

val decode_time_range : Pbrt.Decoder.t -> Gtfs_realtime_types.time_range
(** [decode_time_range decoder] decodes a [time_range] value from [decoder] *)

val decode_entity_selector : Pbrt.Decoder.t -> Gtfs_realtime_types.entity_selector
(** [decode_entity_selector decoder] decodes a [entity_selector] value from [decoder] *)

val decode_alert_cause : Pbrt.Decoder.t -> Gtfs_realtime_types.alert_cause
(** [decode_alert_cause decoder] decodes a [alert_cause] value from [decoder] *)

val decode_alert_effect : Pbrt.Decoder.t -> Gtfs_realtime_types.alert_effect
(** [decode_alert_effect decoder] decodes a [alert_effect] value from [decoder] *)

val decode_translated_string_translation : Pbrt.Decoder.t -> Gtfs_realtime_types.translated_string_translation
(** [decode_translated_string_translation decoder] decodes a [translated_string_translation] value from [decoder] *)

val decode_translated_string : Pbrt.Decoder.t -> Gtfs_realtime_types.translated_string
(** [decode_translated_string decoder] decodes a [translated_string] value from [decoder] *)

val decode_alert : Pbrt.Decoder.t -> Gtfs_realtime_types.alert
(** [decode_alert decoder] decodes a [alert] value from [decoder] *)

val decode_feed_entity : Pbrt.Decoder.t -> Gtfs_realtime_types.feed_entity
(** [decode_feed_entity decoder] decodes a [feed_entity] value from [decoder] *)

val decode_feed_message : Pbrt.Decoder.t -> Gtfs_realtime_types.feed_message
(** [decode_feed_message decoder] decodes a [feed_message] value from [decoder] *)
