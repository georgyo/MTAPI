open! Core
open Mtaproto

let ( >>= ) = Lwt.( >>= )
let ( >|= ) = Lwt.( >|= )

(* let f1 f p = f p
   let f2 f a p = f p a *)
let f3 f a b p = f p a b

(* let (|>>>) p f a b = f p a b *)

let headers =
  let api_key =
    match Sys.getenv "MTA_API_KEY" with
    | None -> failwith "Please set MTA_API_KEY"
    | Some x -> x
  in
  Cohttp.Header.init_with "User-Agent" "ocaml-mta"
  |> f3 Cohttp.Header.add "x-api-key" api_key
  |> Option.some

let body =
  Cohttp_lwt_unix.Client.get ?headers
    (Uri.of_string
       "https://api-endpoint.mta.info/Dataservice/mtagtfsfeeds/nyct%2Fgtfs")
  >>= fun (_, body) ->
  (* let code = resp |> Cohttp.Response.status |> Cohttp.Code.code_of_status in
      Stdio.printf "Response code: %d\n" code;
     Stdio.printf "Headers: %s\n"
       (resp |> Cohttp.Response.headers |> Cohttp.Header.to_string); *)
  body |> Cohttp_lwt.Body.to_string
(* >|= fun body ->
   (* Stdio.printf "Body of length: %d\n" (String.length body); *)
   body *)

(* let () =
     let body = Lwt_main.run body in
     Stdio.print_endline ("Received body\n" ^ body)

   let foo : Models_t.complex =
     {
       n = [ { route = "test"; time = "test" } ];
       s = [ { route = "test"; time = "test" } ];
       id = "foo";
       last_update = "foo";
       name = "foo";
       routes = [ "a"; "b" ];
       stops = [ ("foo", [ 1.0 ]) ];
     }

   let () = Stdio.print_endline (Models_j.string_of_complex foo) *)

let () =
  let body = Lwt_main.run body in
  Pbrt.Decoder.of_string body
  |> Gtfs_realtime_pb.decode_feed_message
  |> Gtfs_realtime_json.string_of_feed_message |> Stdio.print_endline
