exception Ret of int

let triplet n =
  try
    for a = 0 to n do
      for b = a + 1 to n do
        for c = b + 1 to n do
          if (a * a) + (b * b) == c * c && a + b + c == n then
            raise (Ret (a * b * c))
        done
      done
    done;
    raise (Ret (-1))
  with Ret x -> x

let () = Printf.printf "Num: %d\n" (triplet 1000)
