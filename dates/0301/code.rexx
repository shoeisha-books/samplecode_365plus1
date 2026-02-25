/* 今年はうるう年？ 元日から何日目？ 年末まであと何日？
     - 今日の日付を取得（YYYYMMDD）
     - うるう年判定：4で割れる年、ただし100で割れる年は除外、ただし400で割れればうるう年
     - 元日からの通算日（DOY）、年末までの残り日数を表示 */
numeric digits 20
s = date('S')                              /* "YYYYMMDD" */
year  = substr(s,1,4) + 0
month = substr(s,5,2) + 0
day   = substr(s,7,2) + 0
/* うるう年判定（グレゴリオ暦） */
leap = (year // 400 = 0) | ((year // 4 = 0) & (year // 100 <> 0))
/* 月の日数表（2月はうるう年なら29日） */
m.1=31; m.2=28; if leap then m.2=29
m.3=31; m.4=30; m.5=31; m.6=30; m.7=31; m.8=31; m.9=30
m.10=31; m.11=30; m.12=31
/* 通算日（DOY）を計算 */
doy = day
do i = 1 to month-1
    doy = doy + m.i
end
/* 年末までの残り日数 */
total = 365; if leap then total = 366
left  = total - doy
/* 出力 */
ymd = year||"-"||right(month,2,0)||"-"||right(day,2,0)
if leap then leapmsg = "うるう年" ; else leapmsg = "平年"
say ymd
say "今年は"||leapmsg||"。"
say "元日からの通算日: "||doy||" 日目"
say "年末まであと: "||left||" 日"
