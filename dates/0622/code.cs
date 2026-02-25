using System;
class Program
{
    static string Reverse(string? s)
    {
        if (string.IsNullOrEmpty(s)) return string.Empty;
        return s[^1] + Reverse(s[..^1]);
    }
    static void Main()
    {
        Console.Write("文字列を入力してください=> ");
        string? input = Console.ReadLine();
        Console.WriteLine($"逆順: {Reverse(input)}");
        Console.ReadLine();
    }
}