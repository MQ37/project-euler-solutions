let reverse s =
  String.of_seq
    (List.to_seq
       (List.fold_left
          (fun acc x -> [ x ] @ acc)
          []
          (List.of_seq (String.to_seq s))))

let is_palindrome n =
  let s = string_of_int n in
  let l = String.length s / 2 in
  let i = if String.length s mod 2 = 0 then l else l + 1 in
  if String.sub s 0 l = reverse (String.sub s i l) then true else false

let find_palindrome_desc low high =
  let rec inner acc n1 n2 =
    let prod = n1 * n2 in
    let acc = if is_palindrome prod && prod > acc then prod else acc in
    if n1 <= low && n2 > low then inner acc high (n2 - 1) (* return *)
    else if n1 <= low && n2 <= low then acc
    else inner acc (n1 - 1) n2
  in
  inner low high high

let () = Printf.printf "%d\n" (find_palindrome_desc 100 999)
