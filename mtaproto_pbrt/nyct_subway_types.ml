[@@@ocaml.warning "-27-30-39"]

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

let rec default_trip_replacement_period
  ?(route_id : string option = None)
  ?(replacement_period : Gtfs_realtime_types.time_range option = None)
  ()
  : trip_replacement_period
  =
  { route_id; replacement_period }
;;

let rec default_nyct_feed_header
  ?(nyct_subway_version : string = "")
  ?(trip_replacement_period : trip_replacement_period list = [])
  ()
  : nyct_feed_header
  =
  { nyct_subway_version; trip_replacement_period }
;;

let rec default_nyct_trip_descriptor_direction () : nyct_trip_descriptor_direction = North

let rec default_nyct_trip_descriptor
  ?(train_id : string option = None)
  ?(is_assigned : bool option = None)
  ?(direction : nyct_trip_descriptor_direction option = None)
  ()
  : nyct_trip_descriptor
  =
  { train_id; is_assigned; direction }
;;

let rec default_nyct_stop_time_update
  ?(scheduled_track : string option = None)
  ?(actual_track : string option = None)
  ()
  : nyct_stop_time_update
  =
  { scheduled_track; actual_track }
;;
