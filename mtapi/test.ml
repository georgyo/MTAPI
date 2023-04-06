open! Core
open Mtaproto

let ( >>= ) = Lwt.( >>= )
let ( >|= ) = Lwt.( >|= )
let f1 f p = f p
let f2 f a p = f p a
let f3 f a b p = f p a b

let headers =
  let api_key =
    match Sys.getenv "MTA_API_KEY" with
    | None -> failwith "Please set MTA_API_KEY"
    | Some x -> x
  in
  Cohttp.Header.init_with "User-Agent" "ocaml-mta"
  |> f3 Cohttp.Header.add "x-api-key" api_key
  |> Option.some
;;

let body =
  Cohttp_lwt_unix.Client.get
    ?headers
    (Uri.of_string "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs")
  >>= fun (_, body) -> body |> Cohttp_lwt.Body.to_string
;;

let feedMessage =
  let body = Lwt_main.run body in
  Ocaml_protoc_plugin.Reader.create body
  |> Gtfs_realtime.Transit_realtime.FeedMessage.from_proto
  |> function
  | Ok v -> v
  | Error e ->
    failwith
      (Printf.sprintf
         "Could not parse, got error %s"
         (Ocaml_protoc_plugin.Result.show_error e))
;;

(* |> Gtfs_realtime.Transit_realtime.FeedMessage.from_proto
   (* |> Gtfs_realtime_pb.decode_feed_message
   |> Gtfs_realtime_json.string_of_feed_message
   |> Stdio.print_endline *) *)

let must = function
  | Some x -> x
  | None -> failwith "fail"
;;

let ( |!> ) p f = must p |> f
let () = Stdio.print_endline (feedMessage.header.timestamp |!> Int.to_string)
