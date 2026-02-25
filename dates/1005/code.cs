using System;
using System.Linq;

class Program
{
    static void Main()
    {
        Console.WriteLine(" Dec | Hex ");
        Console.WriteLine("-----+------");

        var table = Enumerable.Range(1, 100)
            .Select(n => $"{n,4} | {n:X4}");

        foreach (var line in table)
            Console.WriteLine(line);
    }
}