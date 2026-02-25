program LeapYearCheck;

var
  Year: integer;

// うるう年かどうかを判定する
function isLeapYear(y: integer): boolean;
begin
  { 4で割り切れる年はうるう年
    ただし100で割り切れる年はうるう年ではない
    ただし400で割り切れる年はうるう年 }
  isLeapYear := (y mod 4 = 0) and not (y mod 100 = 0) or (y mod 400 = 0);
end;

begin
  writeln('Enter a year: ');
  readln(Year);
  
  if isLeapYear(Year) then
  begin
    writeln(Year, ' is a leap year.');
  end
  else
  begin
    writeln(Year, ' is not a leap year.');
  end;
end.