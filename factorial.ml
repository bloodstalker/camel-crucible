let rec factoriel n=
  if n = 1 then 1 else n * factoriel (n-1)

let rec fact_match n=
  match n with
  | 1 -> 1
  | _ -> n * fact_match (n-1)

let () =
  ignore (fact_match 10)
