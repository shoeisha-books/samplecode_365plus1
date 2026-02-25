using System;
using System.Linq;
using System.Threading;

class Program
{
    static void Main()
    {
        Console.OutputEncoding = System.Text.Encoding.UTF8;

        int width = 40;
        int height = 12;

        for (int t = 0; t < 100; t++)
        {
            Console.Clear();
            for (int y = 0; y < height; y++)
            {
                var line = Enumerable.Range(0, width)
                    .Select(x => {
                        int waveY = (int)(Math.Sin((x + t) * 0.2) * (height / 2) + (height / 2));
                        return waveY == y ? "■" : " ";
                    });
                Console.WriteLine(string.Join("", line));
            }
            Thread.Sleep(100);
        }
    }
}
