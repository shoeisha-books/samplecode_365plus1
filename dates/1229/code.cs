using System;
using System.Linq;

class Program
{
    static void Main()
    {
        foreach (var group in Enumerable.Range(1, 100).Where(IsPrime).Chunk(5))
            Console.WriteLine(string.Concat(group.Select(n => $"{n,3}")));

        Console.ReadLine();
    }

    static bool IsPrime(int n)
    {
        if (n < 2) return false;
        for (int i = 2; i <= Math.Sqrt(n); i++)
            if (n % i == 0) return false;
        return true;
    }
}
