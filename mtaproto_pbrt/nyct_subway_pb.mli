(** nyct_subway.proto Binary Encoding *)


(** {2 Protobuf Encoding} *)

val encode_trip_replacement_period : Nyct_subway_types.trip_replacement_period -> Pbrt.Encoder.t -> unit
(** [encode_trip_replacement_period v encoder] encodes [v] with the given [encoder] *)

val encode_nyct_feed_header : Nyct_subway_types.nyct_feed_header -> Pbrt.Encoder.t -> unit
(** [encode_nyct_feed_header v encoder] encodes [v] with the given [encoder] *)

val encode_nyct_trip_descriptor_direction : Nyct_subway_types.nyct_trip_descriptor_direction -> Pbrt.Encoder.t -> unit
(** [encode_nyct_trip_descriptor_direction v encoder] encodes [v] with the given [encoder] *)

val encode_nyct_trip_descriptor : Nyct_subway_types.nyct_trip_descriptor -> Pbrt.Encoder.t -> unit
(** [encode_nyct_trip_descriptor v encoder] encodes [v] with the given [encoder] *)

val encode_nyct_stop_time_update : Nyct_subway_types.nyct_stop_time_update -> Pbrt.Encoder.t -> unit
(** [encode_nyct_stop_time_update v encoder] encodes [v] with the given [encoder] *)


(** {2 Protobuf Decoding} *)

val decode_trip_replacement_period : Pbrt.Decoder.t -> Nyct_subway_types.trip_replacement_period
(** [decode_trip_replacement_period decoder] decodes a [trip_replacement_period] value from [decoder] *)

val decode_nyct_feed_header : Pbrt.Decoder.t -> Nyct_subway_types.nyct_feed_header
(** [decode_nyct_feed_header decoder] decodes a [nyct_feed_header] value from [decoder] *)

val decode_nyct_trip_descriptor_direction : Pbrt.Decoder.t -> Nyct_subway_types.nyct_trip_descriptor_direction
(** [decode_nyct_trip_descriptor_direction decoder] decodes a [nyct_trip_descriptor_direction] value from [decoder] *)

val decode_nyct_trip_descriptor : Pbrt.Decoder.t -> Nyct_subway_types.nyct_trip_descriptor
(** [decode_nyct_trip_descriptor decoder] decodes a [nyct_trip_descriptor] value from [decoder] *)

val decode_nyct_stop_time_update : Pbrt.Decoder.t -> Nyct_subway_types.nyct_stop_time_update
(** [decode_nyct_stop_time_update decoder] decodes a [nyct_stop_time_update] value from [decoder] *)
