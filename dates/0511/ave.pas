program AverageExample;
uses
  SysUtils;
var
  i, num, sum: Integer;
  average: Real;
begin
  sum := 0;
  for i := 1 to 10 do
  begin
    Write('整数を入力してください（', i, ' / 10）: ');
    Readln(num);
    sum := sum + num;
  end;
  average := sum / 10.0;
  Writeln('入力された 10 個の整数の平均値は: ', average:0:2);
end.