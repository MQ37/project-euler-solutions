let sum_square l h =
  let rec inner acc n =
    match n with _ when n > h -> acc | _ -> inner (acc + (n * n)) (n + 1)
  in
  inner 0 l

let square_sum l h =
  let rec inner acc n =
    match n with _ when n > h -> acc * acc | _ -> inner (acc + n) (n + 1)
  in
  inner 0 l

let () = Printf.printf "%d\n" (square_sum 1 100 - sum_square 1 100)
