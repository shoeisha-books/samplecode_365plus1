class
    DAY_OF_WEEK
create
    make
feature
    make
        local
            input: STRING
            date: DATE
            weekday: INTEGER
        do
            print ("日付を入力してください (YYYY-MM-DD): ")
            io.read_line
            input := io.last_string
            -- 入力を日付に変換
            create date.make_from_string (input, "yyyy-[0]mm-[0]dd")
            weekday := date.day_of_the_week  -- 1=Monday ... 7=Sunday
            print ("曜日: " + weekday_to_japanese (weekday) + "%N")
        end
    weekday_to_japanese (w: INTEGER): STRING
            -- 数字の曜日を日本語に変換
        do
            inspect w
            when 1 then Result := "月曜日"
            when 2 then Result := "火曜日"
            when 3 then Result := "水曜日"
            when 4 then Result := "木曜日"
            when 5 then Result := "金曜日"
            when 6 then Result := "土曜日"
            when 7 then Result := "日曜日"
            else
                Result := "不明"
            end
        end
end