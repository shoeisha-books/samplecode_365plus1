using System;
using System.Linq;

class Program
{
    static void Main()
    {
        var today = DateTime.Today;
        var firstDay = new DateTime(today.Year, today.Month, 1);
        var daysInMonth = DateTime.DaysInMonth(today.Year, today.Month);

        Console.WriteLine($"{today:yyyy年MM月}");
        Console.WriteLine("日 月 火 水 木 金 土");

        // 1日までの空白を出力
        int currentDayOfWeek = (int)firstDay.DayOfWeek;
        for (int i = 0; i < currentDayOfWeek; i++)
            Console.Write("   ");

        for (int day = 1; day <= daysInMonth; day++)
        {
            Console.Write($"{day,2} ");
            currentDayOfWeek++;
            if (currentDayOfWeek > 6)
            {
                Console.WriteLine();
                currentDayOfWeek = 0;
            }
        }
        // 最終行の改行
        if (currentDayOfWeek != 0) Console.WriteLine();
    }
}