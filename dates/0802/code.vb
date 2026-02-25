Imports System.Text

Module Program
    Sub Main(args As String())
        Console.OutputEncoding = Encoding.UTF8
        Dim art As String() = {
            " ***************************************** ",
            " *                                       * ",
            " *   Happy 40th Anniversary, Shoeisha!   * ",
            " *                                       * ",
            " ***************************************** "
        }
        For Each line As String In art
            Console.WriteLine(line)
        Next
        Console.WriteLine(
            vbCrLf &
            " 翔泳社40周年、おめでとうございます！" & vbCrLf &
            " これからも素晴らしい活動を応援しています！"
        )
    End Sub
End Module