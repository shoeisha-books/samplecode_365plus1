defer +o ' + is +o  defer -o ' - is -o  defer *o ' * is *o
defer /o ' / is /o  defer .s0 ' .s is .s0 : CR2  cr cr ;
warnings off : .s CR2 .s0 cr ; : + +o cr ." stack: " .s0 cr ;
: - -o cr ." stack: " .s0 cr ; : * *o cr ." stack: " .s0 cr ;
: / dup 0= if drop CR2 ." 0で割れない" cr exit then 
2dup mod 0= if /o cr ." stack: " .s0 cr else 2drop CR2
." 割り切れない" cr then ; warnings on
: clear depth 0 ?do drop loop ;
variable seed  : seed! utime drop seed ! ;
: rnd 1103515245 seed @ *o 12345 +o dup seed ! abs ;
: rnd9 rnd 9 mod 1+ ; : deal  CR2 clear seed!  rnd9 . space 
rnd9 . space rnd9 . space rnd9 . cr
 ." ↑ この4つを一度ずつ使い24を作ってください（RPNで）" cr
 ."    解がない場合は、dealをもう一度実行するか、別途4つの数字を考えてください。" cr ;
: check \ 値判定。24以外の場合は値は残す
 CR2  depth 1 <> if ." 要素数が合わない" cr exit then
 dup dup 24 = if   \ スタック: v v flag
  drop drop ." 24! おめでとう" cr
 else drop ." 結果: " dup . cr then ;
: help  CR2 ." 【遊び方】" cr  ." 1) 「deal」4つ確認" cr
 ." 2) RPNで数値と[+ - * /]を入力" cr ." 3) 「check」で判定"
 CR2 ." 例 RPN: 7 8 8 / - 4 *   数式: (7 - 8/8) * 4 = 24" cr
 ." その他コマンド:「.s」=表示 「clear」=消去 「q」=終了 「bye」=gforth終了" cr ;
variable run  : q false run ! ;
: play true run ! help cr ." まずは deal を入力" cr
  begin run @ while cr ." >> " pad 200 accept pad swap
    ['] evaluate catch ?dup if drop clear CR2 
 ." 入力エラー(help参照)" cr then repeat ; play