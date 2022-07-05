let is_divisible n d = match n mod d with 0 -> true | _ -> false

let find_multiple l h =
  let rec inner acc n =
    match is_divisible acc n with
    | true -> ( match n with _ when n = h -> acc | _ -> inner acc (n + 1))
    | false -> inner (acc + 1) l
  in
  inner h l

let () = Printf.printf "%d\n" (find_multiple 11 20)
