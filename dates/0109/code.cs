using System;
using System.Linq;

class Program
{
    static void Main()
    {
        var data = new[] { 12, 1, 21, 2, 20, 3, 10, 11 };
        data.OrderBy(n => n)
            .GroupBy(n => n - data.OrderBy(x => x).TakeWhile(x => x != n).Count())
            .ToList()
            .ForEach(g => Console.WriteLine(string.Join(", ", g)));
    }
}
