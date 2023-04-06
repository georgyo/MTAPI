[@@@ocaml.warning "-27-30-39"]

type trip_replacement_period_mutable =
  { mutable route_id : string option
  ; mutable replacement_period : Gtfs_realtime_types.time_range option
  }

let default_trip_replacement_period_mutable () : trip_replacement_period_mutable =
  { route_id = None; replacement_period = None }
;;

type nyct_feed_header_mutable =
  { mutable nyct_subway_version : string
  ; mutable trip_replacement_period : Nyct_subway_types.trip_replacement_period list
  }

let default_nyct_feed_header_mutable () : nyct_feed_header_mutable =
  { nyct_subway_version = ""; trip_replacement_period = [] }
;;

type nyct_trip_descriptor_mutable =
  { mutable train_id : string option
  ; mutable is_assigned : bool option
  ; mutable direction : Nyct_subway_types.nyct_trip_descriptor_direction option
  }

let default_nyct_trip_descriptor_mutable () : nyct_trip_descriptor_mutable =
  { train_id = None; is_assigned = None; direction = None }
;;

type nyct_stop_time_update_mutable =
  { mutable scheduled_track : string option
  ; mutable actual_track : string option
  }

let default_nyct_stop_time_update_mutable () : nyct_stop_time_update_mutable =
  { scheduled_track = None; actual_track = None }
;;

let rec decode_trip_replacement_period d =
  let v = default_trip_replacement_period_mutable () in
  let continue__ = ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None ->
      ();
      continue__ := false
    | Some (1, Pbrt.Bytes) -> v.route_id <- Some (Pbrt.Decoder.string d)
    | Some (1, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(trip_replacement_period), field(1)" pk
    | Some (2, Pbrt.Bytes) ->
      v.replacement_period
        <- Some (Gtfs_realtime_pb.decode_time_range (Pbrt.Decoder.nested d))
    | Some (2, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(trip_replacement_period), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({ Nyct_subway_types.route_id = v.route_id
   ; Nyct_subway_types.replacement_period = v.replacement_period
   }
    : Nyct_subway_types.trip_replacement_period)
;;

let rec decode_nyct_feed_header d =
  let v = default_nyct_feed_header_mutable () in
  let continue__ = ref true in
  let nyct_subway_version_is_set = ref false in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None ->
      v.trip_replacement_period <- List.rev v.trip_replacement_period;
      continue__ := false
    | Some (1, Pbrt.Bytes) ->
      v.nyct_subway_version <- Pbrt.Decoder.string d;
      nyct_subway_version_is_set := true
    | Some (1, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(nyct_feed_header), field(1)" pk
    | Some (2, Pbrt.Bytes) ->
      v.trip_replacement_period
        <- decode_trip_replacement_period (Pbrt.Decoder.nested d)
           :: v.trip_replacement_period
    | Some (2, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(nyct_feed_header), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  if not !nyct_subway_version_is_set then Pbrt.Decoder.missing_field "nyct_subway_version";
  ({ Nyct_subway_types.nyct_subway_version = v.nyct_subway_version
   ; Nyct_subway_types.trip_replacement_period = v.trip_replacement_period
   }
    : Nyct_subway_types.nyct_feed_header)
;;

let rec decode_nyct_trip_descriptor_direction d =
  match Pbrt.Decoder.int_as_varint d with
  | 1 -> (Nyct_subway_types.North : Nyct_subway_types.nyct_trip_descriptor_direction)
  | 2 -> (Nyct_subway_types.East : Nyct_subway_types.nyct_trip_descriptor_direction)
  | 3 -> (Nyct_subway_types.South : Nyct_subway_types.nyct_trip_descriptor_direction)
  | 4 -> (Nyct_subway_types.West : Nyct_subway_types.nyct_trip_descriptor_direction)
  | _ -> Pbrt.Decoder.malformed_variant "nyct_trip_descriptor_direction"
;;

let rec decode_nyct_trip_descriptor d =
  let v = default_nyct_trip_descriptor_mutable () in
  let continue__ = ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None ->
      ();
      continue__ := false
    | Some (1, Pbrt.Bytes) -> v.train_id <- Some (Pbrt.Decoder.string d)
    | Some (1, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(nyct_trip_descriptor), field(1)" pk
    | Some (2, Pbrt.Varint) -> v.is_assigned <- Some (Pbrt.Decoder.bool d)
    | Some (2, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(nyct_trip_descriptor), field(2)" pk
    | Some (3, Pbrt.Varint) ->
      v.direction <- Some (decode_nyct_trip_descriptor_direction d)
    | Some (3, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(nyct_trip_descriptor), field(3)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({ Nyct_subway_types.train_id = v.train_id
   ; Nyct_subway_types.is_assigned = v.is_assigned
   ; Nyct_subway_types.direction = v.direction
   }
    : Nyct_subway_types.nyct_trip_descriptor)
;;

let rec decode_nyct_stop_time_update d =
  let v = default_nyct_stop_time_update_mutable () in
  let continue__ = ref true in
  while !continue__ do
    match Pbrt.Decoder.key d with
    | None ->
      ();
      continue__ := false
    | Some (1, Pbrt.Bytes) -> v.scheduled_track <- Some (Pbrt.Decoder.string d)
    | Some (1, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(nyct_stop_time_update), field(1)" pk
    | Some (2, Pbrt.Bytes) -> v.actual_track <- Some (Pbrt.Decoder.string d)
    | Some (2, pk) ->
      Pbrt.Decoder.unexpected_payload "Message(nyct_stop_time_update), field(2)" pk
    | Some (_, payload_kind) -> Pbrt.Decoder.skip d payload_kind
  done;
  ({ Nyct_subway_types.scheduled_track = v.scheduled_track
   ; Nyct_subway_types.actual_track = v.actual_track
   }
    : Nyct_subway_types.nyct_stop_time_update)
;;

let rec encode_trip_replacement_period
  (v : Nyct_subway_types.trip_replacement_period)
  encoder
  =
  (match v.Nyct_subway_types.route_id with
   | Some x ->
     Pbrt.Encoder.key (1, Pbrt.Bytes) encoder;
     Pbrt.Encoder.string x encoder
   | None -> ());
  (match v.Nyct_subway_types.replacement_period with
   | Some x ->
     Pbrt.Encoder.key (2, Pbrt.Bytes) encoder;
     Pbrt.Encoder.nested (Gtfs_realtime_pb.encode_time_range x) encoder
   | None -> ());
  ()
;;

let rec encode_nyct_feed_header (v : Nyct_subway_types.nyct_feed_header) encoder =
  Pbrt.Encoder.key (1, Pbrt.Bytes) encoder;
  Pbrt.Encoder.string v.Nyct_subway_types.nyct_subway_version encoder;
  List.iter
    (fun x ->
      Pbrt.Encoder.key (2, Pbrt.Bytes) encoder;
      Pbrt.Encoder.nested (encode_trip_replacement_period x) encoder)
    v.Nyct_subway_types.trip_replacement_period;
  ()
;;

let rec encode_nyct_trip_descriptor_direction
  (v : Nyct_subway_types.nyct_trip_descriptor_direction)
  encoder
  =
  match v with
  | Nyct_subway_types.North -> Pbrt.Encoder.int_as_varint 1 encoder
  | Nyct_subway_types.East -> Pbrt.Encoder.int_as_varint 2 encoder
  | Nyct_subway_types.South -> Pbrt.Encoder.int_as_varint 3 encoder
  | Nyct_subway_types.West -> Pbrt.Encoder.int_as_varint 4 encoder
;;

let rec encode_nyct_trip_descriptor (v : Nyct_subway_types.nyct_trip_descriptor) encoder =
  (match v.Nyct_subway_types.train_id with
   | Some x ->
     Pbrt.Encoder.key (1, Pbrt.Bytes) encoder;
     Pbrt.Encoder.string x encoder
   | None -> ());
  (match v.Nyct_subway_types.is_assigned with
   | Some x ->
     Pbrt.Encoder.key (2, Pbrt.Varint) encoder;
     Pbrt.Encoder.bool x encoder
   | None -> ());
  (match v.Nyct_subway_types.direction with
   | Some x ->
     Pbrt.Encoder.key (3, Pbrt.Varint) encoder;
     encode_nyct_trip_descriptor_direction x encoder
   | None -> ());
  ()
;;

let rec encode_nyct_stop_time_update (v : Nyct_subway_types.nyct_stop_time_update) encoder
  =
  (match v.Nyct_subway_types.scheduled_track with
   | Some x ->
     Pbrt.Encoder.key (1, Pbrt.Bytes) encoder;
     Pbrt.Encoder.string x encoder
   | None -> ());
  (match v.Nyct_subway_types.actual_track with
   | Some x ->
     Pbrt.Encoder.key (2, Pbrt.Bytes) encoder;
     Pbrt.Encoder.string x encoder
   | None -> ());
  ()
;;
