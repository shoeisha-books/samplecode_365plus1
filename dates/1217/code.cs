using System;
using System.Threading;

class Program
{
    static void Main()
    {
        string text = "************* HELLO WORLD! *************";
        int width = 60;
        int[] wave = new int[text.Length];
        for (int frame = 0; frame < 100; frame++){
            Console.Clear();
            for (int i = 0; i < text.Length; i++){
                wave[i] = (int)(Math.Sin((frame + i) * 0.2) * 5 + 10);
            }
            for (int y = 0; y < 20; y++){
                for (int x = 0; x < width; x++){
                    bool printed = false;
                    for (int i = 0; i < text.Length; i++){
                        if (x == i + 20 && y == wave[i]){
                            Console.Write(text[i]);
                            printed = true;
                            break;
                        }
                    }
                    if (!printed) Console.Write(" ");
                }
                Console.WriteLine();
            }
            Thread.Sleep(50);
        }
    }
}
