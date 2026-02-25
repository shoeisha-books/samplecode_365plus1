class
    FIBONACCI_SEQUENCE
create
    make
feature
    make
        local
            a, b, temp: INTEGER
            i, n: INTEGER
        do
            print ("フィボナッチ数列をいくつ出力しますか？: ")
            io.read_integer
            n := io.last_integer
            if n <= 0 then
                print ("1以上の整数を入力してください。%N")
            else
                a := 0
                b := 1
                from i := 1 until i > n loop
                    print (a.out + "%N")
                    temp := a + b
                    a := b
                    b := temp
                    i := i + 1
                end
            end
        end
end