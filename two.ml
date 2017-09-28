open Core

let rec factorial arg=
  let line = In_channel.input_line In_channel.stdin in
  let x = Int.of_string line in
  match x with
  | None -> x
  | Some if Int.of_string x <= 1 then 1 else x * factorial (x - 1)
