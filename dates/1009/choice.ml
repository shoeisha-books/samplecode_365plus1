let selection_sort lst =
  let arr = Array.of_list lst in
  let n = Array.length arr in
  for i = 0 to n - 2 do
    (* 最小値のインデックスを探す *)
    let min_idx = ref i in
    for j = i + 1 to n - 1 do
      if arr.(j) < arr.(!min_idx) then min_idx := j
    done;
    (* i 番目と最小値を交換 *)
    if !min_idx <> i then
      let tmp = arr.(i) in
      arr.(i) <- arr.(!min_idx);
      arr.(!min_idx) <- tmp
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
  let sorted = selection_sort nums in
  print_endline "ソート結果:";
  List.iter (fun x -> print_int x; print_string " ") sorted;
  print_newline ()
