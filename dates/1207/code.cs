using System;
using System.Linq;

class Program
{
    static void Main()
    {
        var table = Enumerable.Range(1, 9)
            .Select(i => Enumerable.Range(1, 9)
                .Select(j => i * j).ToArray())
            .ToArray();

        foreach (var row in table)
        {
            foreach (var value in row)
                Console.Write($"{value,3}");
            Console.WriteLine();
        }
    }
}
