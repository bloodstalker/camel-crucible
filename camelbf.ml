let rec eval str =
  let cells = Array.make 4096 0 in
  let ptr = ref 0 in
  let len = String.length str in
  let rec evalbf c =
    if c >= len then
      c
    else
      match String.get str c with 
      | '>' -> ptr := !ptr + 1; evalbf (c + 1)
      | '<' -> ptr := !ptr - 1; evalbf (c + 1)
      | '+' -> cells.(!ptr) <- cells.(!ptr) + 1; evalbf (c + 1)
      | '-' -> cells.(!ptr) <- cells.(!ptr) - 1; evalbf (c + 1)
      | '.' -> Printf.printf "%c" (Char.chr cells.(!ptr)); evalbf (c + 1)
      | '[' -> 
          let newp = ref c in
          while cells.(!ptr) != 0 do
            newp := evalbf (c + 1)
          done;
          evalbf(!newp + 1)
      | ']' -> c
      | _ -> evalbf(c + 1)
  in
  ignore (evalbf 0)

let () =
  eval "++++++++[>++++[>++>+++>+++>+<<<<-]>+>+>->>+[<]<-]>>.>---.+++++++..+++.>>.<-.<.+++.------.--------.>>+.>++."
