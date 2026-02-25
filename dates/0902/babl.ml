let bubble_sort lst =
  let arr = Array.of_list lst in
  let n = Array.length arr in
  for i = 0 to n - 2 do
    for j = 0 to n - 2 - i do
      if arr.(j) > arr.(j + 1) then
        let temp = arr.(j) in
        arr.(j) <- arr.(j + 1);
        arr.(j + 1) <- temp
    done
  done;
  Array.to_list arr

let () =
  let rec read_n n acc =
    if n = 0 then List.rev acc
    else (
      print_string ("整数を入力してください（残り " ^ string_of_int n ^ " 個）: ");
      flush stdout;
      let line = read_line () in
      let num = int_of_string line in
      read_n (n - 1) (num :: acc)
    )
  in
  let nums = read_n 7 [] in
  let sorted = bubble_sort nums in
  print_endline "ソート結果:";
  List.iter (fun x -> print_int x; print_string " ") sorted;
  print_newline ()
