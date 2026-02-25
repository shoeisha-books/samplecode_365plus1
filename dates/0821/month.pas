program MonthDaysWithError;
uses
  SysUtils;
var
  month: Integer;
begin
  Write('月を入力してください（1～12）: ');
  Readln(month);
  if (month < 1) or (month > 12) then
    Writeln('エラー: 1～12 の範囲で入力してください。')
  else
    case month of
      1, 3, 5, 7, 8, 10, 12: Writeln('31日あります。');
      4, 6, 9, 11: Writeln('30日あります。');
      2: Writeln('28日あります。');
    end;
end.
