# 入力欄の数値を加算していくプログラム

package require Tk

# 入力欄、足すボタン、出力欄
entry .input
button .add -text "Add" -command addNum
entry .output
pack .input .add .output

set sum 0

# 合計に足すプロシージャ
proc addNum args {
    global sum
    set sum [expr $sum + [.input get]]
    showSum
}

# 合計を表示するプロシージャ
proc showSum args {
    global sum
    .output delete 0 end
    .output insert 0 $sum
}

showSum
vwait forever