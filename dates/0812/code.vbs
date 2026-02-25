Dim primes() ' 素数を格納する配列変数
Dim primeCount ' 発見した素数の個数
Dim i, j ' ループ変数
Dim isPrime ' 素数かどうかの真理値
Dim n ' 調べる最大の自然数

n = inputBox("いくつまでの素数を調べますか？")
primeCount = 0

For i = 2 To n
    isPrime = True
    ' 追加済みの素数で割り算
    For j = 1 To primeCount
        ' ルートi以下の約数がなければ素数
        If(primes(j) * primes(j) > i) Then Exit For
        ' いずれかの素数で割り切れたら合成数
        If (i Mod primes(j)) = 0 Then isPrime = False: Exit For
    Next
    ' 素数だった場合
    If isPrime Then
        ' 素数の個数を加算
        primeCount = primeCount + 1
        ' 配列の要素数を増やす
        ReDim Preserve primes(primeCount)
         ' 新しい素数を配列に追加
        primes(primeCount) = i
    End If
Next

' 結果表示用の変数
Dim result
result = ""
For i = 1 To primeCount
    ' 各素数をカンマ区切りで追加
    result = result & primes(i) & ", "
    If i Mod 10 = 0 Then result = result & vbCrLf
Next
' 結果が空でない場合
If result <> "" Then
    ' 最後のカンマとスペースを削除
    result = Left(result, Len(result) - 2)
End If
WScript.Echo "発見した素数: " & vbCrLf & result