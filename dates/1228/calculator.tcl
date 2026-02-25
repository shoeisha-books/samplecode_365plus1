#!/usr/bin/env tclsh

package require Tk

# 初期化
set expr ""

entry .display -width 20 -justify right -textvariable expr
grid .display -columnspan 4

set buttons {
    {7 8 9 /}
    {4 5 6 *}
    {1 2 3 -}
    {0 . = +}
}

set r 0
foreach row $buttons {
    set c 0
    foreach b $row {
        button .b$b -text $b -width 5 -command [list btnPress $b]
        grid .b$b -row [expr {$r + 1}] -column $c
        incr c
    }
    incr r
}

proc btnPress {val} {
    global expr
    if {$val eq "="} {
        if {[catch {expr $expr} result]} {
            set expr "Error"
        } else {
            set expr $result
        }
    } else {
        if {$expr eq "Error"} {
            set expr ""
        }
        append expr $val
    }
}

# GUIが閉じられるまで待つ
tkwait window .
