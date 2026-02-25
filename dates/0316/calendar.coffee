# 月のカレンダーを表示する関数
showCalendar = (year, month) ->
  # JavaScriptは0始まりなので調整
  firstDay = new Date(year, month - 1, 1)
  lastDay  = new Date(year, month, 0)

  console.log ":日付: #{year}年#{month}月"
  console.log "Su Mo Tu We Th Fr Sa"

  # 最初の週の空白を出力
  days = []
  for i in [0...firstDay.getDay()]
    days.push "  "

  # 日付を追加
  for d in [1..lastDay.getDate()]
    days.push (" " + d).slice(-2)

    if days.length % 7 is 0
      console.log days.join " "
      days = []

  # 最後に残った分を出力
  console.log days.join " " if days.length > 0