using System;

class Program
{
    static void Main()
    {
        for (int n = 0; n <= 10; n++)
        {
            Console.WriteLine($"{n}! = {Factorial(n)}");
        }
        Console.ReadLine();
    }

    static int Factorial(int n)
    {
        if (n == 0) return 1;
        return n * Factorial(n - 1);
    }
}