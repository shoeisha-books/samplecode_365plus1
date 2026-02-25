program TriangleExample;
uses
  SysUtils;
procedure PrintTriangle(Size: Integer; Ch: Char);
var
  i, j: Integer;
begin
  for i := 1 to Size do
  begin
    for j := 1 to i do
      Write(Ch);
    Writeln;
  end;
end;
var
  n: Integer;
begin
  Write('三角形のサイズを入力してください: ');
  Readln(n);
  PrintTriangle(n, '*');  // ここで文字を指定できます
end.