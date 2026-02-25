using System;
using System.Linq;
class Program
{
    static void Main()
    {
        Console.OutputEncoding = System.Text.Encoding.UTF8;
        Enumerable.Range(0, 10)
        .Select(i => new string('■', i + 1))
        .ToList()
        .ForEach(bar => {
            Console.ForegroundColor = (ConsoleColor)(bar.Length % 16);
            Console.WriteLine(bar);
        });
    }
}
