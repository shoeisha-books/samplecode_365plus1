#!/bin/sh
# ディレクトリが指定されていればそれを使用、なければ現在のディレクトリを使用
[ -d "$1" ] && DIR=$1 && shift || DIR=. 
# ディレクトリを絶対パスに変換
(cd ${DIR}; pwd)
# ディレクトリ内のファイルとサブディレクトリをリストアップし、ツリー形式で表示
find "${DIR}" | \
awk -v dir="${DIR}" '
function is_dir(path,  cmd, result) {
    cmd = "test -d "" dir path "" && echo 1 || echo 0"
    cmd | getline result
    close(cmd)
    return result == 1
}
{
    sub("^" dir, "", $0)      # 先頭のディレクトリパスを削除
    if ($0 == "") next        # 空行はスキップ
    n = split($0, parts, "/") # パスをスラッシュで分割
    indent = ""
    for (i = 2; i < n; i++) indent = indent "   " # インデント作成
    name = parts[n]
    if (is_dir($0)) {
        # ディレクトリは青色
        print indent "+---\033[34m " name "\033[0m"
    } else {
        # ファイルは色なし
        print indent "+-- " name
    }
}
