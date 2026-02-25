Console.OutputEncoding = System.Text.Encoding.UTF8;

string[] art = {
    " ***************************************** ",
    " *                                       * ",
    " *   Happy 40th Anniversary, Shoeisha!   * ",
    " *                                       * ",
    " ***************************************** ",
};

art.ToList().ForEach(Console.WriteLine);
Console.WriteLine(
    "\n" +
    " 翔泳社40周年、おめでとうございます！\n" +
    " これからも素晴らしい活動を応援しています！"
);