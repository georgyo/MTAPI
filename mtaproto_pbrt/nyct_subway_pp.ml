[@@@ocaml.warning "-27-30-39"]

let rec pp_trip_replacement_period fmt (v : Nyct_subway_types.trip_replacement_period) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "route_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Nyct_subway_types.route_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "replacement_period"
      (Pbrt.Pp.pp_option Gtfs_realtime_pp.pp_time_range)
      fmt
      v.Nyct_subway_types.replacement_period
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_nyct_feed_header fmt (v : Nyct_subway_types.nyct_feed_header) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "nyct_subway_version"
      Pbrt.Pp.pp_string
      fmt
      v.Nyct_subway_types.nyct_subway_version;
    Pbrt.Pp.pp_record_field
      ~first:false
      "trip_replacement_period"
      (Pbrt.Pp.pp_list pp_trip_replacement_period)
      fmt
      v.Nyct_subway_types.trip_replacement_period
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_nyct_trip_descriptor_direction
  fmt
  (v : Nyct_subway_types.nyct_trip_descriptor_direction)
  =
  match v with
  | Nyct_subway_types.North -> Format.fprintf fmt "North"
  | Nyct_subway_types.East -> Format.fprintf fmt "East"
  | Nyct_subway_types.South -> Format.fprintf fmt "South"
  | Nyct_subway_types.West -> Format.fprintf fmt "West"
;;

let rec pp_nyct_trip_descriptor fmt (v : Nyct_subway_types.nyct_trip_descriptor) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "train_id"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Nyct_subway_types.train_id;
    Pbrt.Pp.pp_record_field
      ~first:false
      "is_assigned"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_bool)
      fmt
      v.Nyct_subway_types.is_assigned;
    Pbrt.Pp.pp_record_field
      ~first:false
      "direction"
      (Pbrt.Pp.pp_option pp_nyct_trip_descriptor_direction)
      fmt
      v.Nyct_subway_types.direction
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;

let rec pp_nyct_stop_time_update fmt (v : Nyct_subway_types.nyct_stop_time_update) =
  let pp_i fmt () =
    Pbrt.Pp.pp_record_field
      ~first:true
      "scheduled_track"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Nyct_subway_types.scheduled_track;
    Pbrt.Pp.pp_record_field
      ~first:false
      "actual_track"
      (Pbrt.Pp.pp_option Pbrt.Pp.pp_string)
      fmt
      v.Nyct_subway_types.actual_track
  in
  Pbrt.Pp.pp_brk pp_i fmt ()
;;
