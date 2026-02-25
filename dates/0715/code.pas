{ パスカルの三角形を表示するプログラム }
program PascalTriangle;
const
    n = 5;
var
    row, col: integer;
    arr: array[1..n, 1..n] of integer;
begin
    for row := 1 to n do
    begin
    write('':((n - row) * 2));
    for col := 1 to row do
    begin
        if (col = 1) or (col = row) then
        arr[row, col] := 1
        else
        arr[row, col] := arr[row - 1, col - 1] + arr[row - 1, col];
        write(arr[row, col]:4)
    end;
    writeln
    end
end.
{ 出力:
           1
         1   1
       1   2   1
     1   3   3   1
   1   4   6   4   1
}
