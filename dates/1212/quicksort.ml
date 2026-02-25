let rec quicksort = function
  | [] -> []
  | x :: xs ->
      let smaller = List.filter (fun y -> y <= x) xs in
      let larger  = List.filter (fun y -> y > x) xs in
      quicksort smaller @ [x] @ quicksort larger

let () =
  print_endline "7つの整数を入力してください（スペース区切り）:";
  let line = read_line () in
  let nums =
    line
    |> String.split_on_char ' '
    |> List.filter (fun s -> s <> "")
    |> List.map int_of_string
  in
  if List.length nums <> 7 then
    print_endline "エラー: 7つの整数を入力してください。"
  else
    let sorted = quicksort nums in
    print_endline ("ソート結果: " ^
      (String.concat " " (List.map string_of_int sorted)))
