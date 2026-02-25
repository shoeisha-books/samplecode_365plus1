class
    RANDOM_NUMBERS
create
    make
feature
    make
        local
            rng: RANDOM
            i: INTEGER
        do
            -- 乱数生成器を作成して初期化
            create rng.make
            rng.start
            -- 整数の乱数を10個出力 (0〜99)
            from i := 1 until i > 10 loop
                rng.forth
                print ((rng.item \\ 100).out + "%N")
                i := i + 1
            end
        end
end