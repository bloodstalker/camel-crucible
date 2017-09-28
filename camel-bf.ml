open Core
open String

type bf_instr =
  | DP_INC
  | DP_DEC
  | D_INC
  | D_DEC
  | PUTCH
  | GETCH
  | JZ
  | JNZ
  | NOP

  let rec bf_parser __bf_str =
