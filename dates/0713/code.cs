using System;
using System.Threading;

class Program
{
    static void Main()
    {
        string[] pattern =
        {
            "A---------T",
            " G-------C ",
            "  A-----T  ",
            "   G---C   ",
            "    A-T    ",
            "   C---G   ",
            "  T-----A  ",
            " C-------G ",
        };

        for (int t = 0; t < 100; t++)
        {
            Console.Clear();
            for (int i = 0; i < pattern.Length; i++)
            {
                int shift = (t + i) % pattern.Length;
                Console.WriteLine(pattern[shift]);
            }
            Thread.Sleep(100);
        }
    }
}