#!/usr/bin/env perl

use strict;
use warnings;
use utf8;
use Encode;

my $print_title = "整数の加法";
my $num_of_eq = 120; # 問題数
my $num_of_rng = 100; # 数値幅

my @ques; # 問題用配列
my @ans; # 解答用配列

# メイン 問題解答生成
for (1..$num_of_eq) {
    my @number = gen_num(2, $num_of_rng, 1); # 数字生成
    my $eq = $number[0]; # 問題の式
    my $ans; # 解答
    if(int(rand(2))>0){
        $eq .= "+";
        $ans=$number[0]+$number[1];
    } else {
        $eq .= "-";
        $ans=$number[0]-$number[1];
    }
    if ($number[1]<0) {
        $eq .= "(" . $number[1] . ")";
    } else {
        $eq .= $number[1];
    }

    push @ques, $eq;
    push @ans, $ans;

}


####*####*####*####*####*####*####*####*####*####*
####*####*  LaTeX ソース
####*####*####*####*####*####*####*####*####*####*

# ヘッダ プリアンブル
my $header =<<HEADER;
\\documentclass[b5paper,10pt]{ltjsarticle}

\\usepackage[top=20truemm,bottom=10truemm,left=10truemm,right=10truemm]{geometry}

\\usepackage{fancyhdr}
\\pagestyle{fancy}
\\fancyhead[L]{\\fbox{ $print_title }\\qquad {\\tiny 生成日:\\today}}
\\fancyhead[R]{クラス\\hspace{30pt}番号\\hspace{30pt}名前\\hspace{100pt} \\qquad / $num_of_eq }
\\fancyfoot{}

\\renewcommand{\\labelenumi}{(\\theenumi)}
\\usepackage{multicol}

\\begin{document}
\\small
HEADER

# multicols 環境
my $begin_multicols =<<BEGINMULTICOLS;
\\begin{multicols}{3}
\\begin{enumerate}
\\setlength{\\itemsep}{2.5pt}
BEGINMULTICOLS

my $end_multicols =<<ENDMULTICOLS;
\\end{enumerate}
\\end{multicols}
ENDMULTICOLS

# フッタ出力
my $footer =<<FOOTER;
\\end{document}
FOOTER


####*####*####*####*####*####*####*####*####*####*
####*####*  LaTeX コード出力
####*####*####*####*####*####*####*####*####*####*
print encode('UTF-8', $header);

print $begin_multicols;

# 問題出力
for my $i (0..$#ques){
    print '\item $', $ques[$i], '\phantom{=', $ans[$i], '}$', "\n";
}

print $end_multicols;
print '\newpage', "\n";
print $begin_multicols;

# 解答出力
for my $i (0..$#ques){
    print '\item $', $ques[$i], '=', $ans[$i], '$', "\n";
}

print $end_multicols;
print $footer;

####*####*####*####*####*####*####*####*####*####*
#
# サブルーチン
#
# 数字の生成
# 引数
# 1. 生成する数字の個数 1以上の整数
# 2. 数字の大きさ 1以上の整数n を指定すると、 -n ～ n を生成
# 3. 零の有無 フラグ0 を立てると生成する数に0を含まない
#
sub gen_num {
    my ($item, $range, $zero) = @_;
    return map {
        my $n = int(rand(2*$range + $zero)) - $range;
        if (!($zero) && $n>=0) {$n++};
        $n;
    } (1..$item);
}