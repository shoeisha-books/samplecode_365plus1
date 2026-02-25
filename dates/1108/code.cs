using System;

public class TextUtil
{
    public static void Main()
    {
        DateTime checkDate = new DateTime(2001, 1, 1);
        //checkDate = DateTime.Today;
        Debug.Log(checkDate.Year.ToString() +"年は"+ GetWareki(checkDate) +"です");
    }
    public static string GetWareki(DateTime checkDate)
    {
        string retText = checkDate.Year switch
        {
            < 1912 => "明治以前",
            < 1926 => "大正",
            < 1989 => "昭和",
            < 2019 => "平成",
            _ => "令和",
        };
        return retText;
    }
}