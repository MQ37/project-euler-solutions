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

let find_prime_factors x = 
    let inverse n acc =
        match is_prime (x / n) with
        | true -> acc @ [n]
        | false -> acc
    in
    let rec factors n acc =
        match n with
        (* until sqrt(x) *)
        | _ when n*n > x -> acc
        | _ -> begin
            (* is divisor *)
            match x mod n with
            | 0 -> begin
                match is_prime n with
                | true -> factors (n + 1) (inverse n (acc @ [n]))
                | false -> factors (n + 1) (inverse n acc)
            end
            (* is not divisor *)
            | _ -> factors (n + 1) acc
        end
    in factors 2 []

let print_array arr =
    List.iter (fun x -> Printf.printf "Num: %d\n" x) arr

let () = print_array (find_prime_factors (int_of_string Sys.argv.(1)))
