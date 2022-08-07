let is_prime x = 
    match x with
    | 0 -> false
    | 1 -> false
    | _ ->
        let rec divisible n = 
            match n with
            | _ when n * n > x -> true
            | _ -> begin
                match x mod n with
                | 0 -> false
                | _ -> divisible (n + 1)
            end
        in divisible 2

let find_prime n = 
    let rec inner x i =
        match is_prime x with
        | true -> begin 
            match i with
            | _ when i > (n-1) -> x
            | _ -> inner (x+1) (i+1)
        end
        | false -> inner (x+1) i
    in inner 2 1

let () = Printf.printf "Num: %d\n" (find_prime 10001)
