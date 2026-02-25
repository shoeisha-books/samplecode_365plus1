using System;
using System.Linq;
class Program
{
    static void Main()
    {
        int RotateLeft(int value, int bits) => 
            ((value << bits) | (value >> (4 - bits))) & 0xF;
        var result = Enumerable.Range(0, 16)
        .Select(v => new {
            Original 
                = Convert.ToString(v, 2).PadLeft(4,'0'),
            Rotated 
                = Convert.ToString(RotateLeft(v, 1),2).PadLeft(4,'0')
        });
        foreach (var r in result)
            Console.WriteLine($"{r.Original} → {r.Rotated}");
    }
}