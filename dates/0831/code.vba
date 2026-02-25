モジュール変数
Dim defPrinter As String 

Private Sub Workbook_BeforePrint(Cancel As Boolean)
    Const regPath As String = "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Devices"
    Const printerName As String = "xxxxxxx"    '←出力先にしたいプリンタ名
    
    Dim objWshShell As Object
    Dim tmpValue As String
    
    Set objWshShell = CreateObject("WScript.Shell")
    tmpValue = objWshShell.RegRead(regPath & printerName)
    tmpValue = Replace(tmpValue, "winspool,", "")

    defPrinter = Application.ActivePrinter
    Application.ActivePrinter = printerName & " on " & tmpValue
    
    Application.OnTime Now(), "ThisWorkbook.subAfterPrint"
End Sub

Private Sub subAfterPrint()
    Application.ActivePrinter = defPrinter
End Sub