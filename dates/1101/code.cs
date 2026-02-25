using System;

public class TextUtil
{
    public static void Main()
    {
        DateTime checkDate;
        //checkDate = new DateTime(2026, 2, 1);
        checkDate = DateTime.Today;
        Console.WriteLine(checkDate.ToString() +"は"+ GetYoubi(checkDate)+"です");
    }
    public static string GetYoubi(DateTime checkDate)
    {
        string retText = string.Empty;
        switch((int)checkDate.DayOfWeek)
        {
        case 1:
            retText = "月";
            break;
        case 2:
            retText = "火";
            break;
        case 3:
            retText = "水";
            break;
        case 4:
            retText = "木";
            break;
        case 5:
            retText = "金";
            break;
        case 6:
            retText = "土";
            break;
        define:
            retText = "日";
            break;
        }
        return retText +"曜日";
    }
}