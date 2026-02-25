class Program
{
    static void Main()
    {
        DrawStars(10);
        Console.ReadLine();
    }
    static void DrawStars(int level)
    {
        for (int i = 1; i <= level; i++)
        {
            int spaces = level - i;
            int stars = 2 * i - 1;
            Console.WriteLine(
                new string(' ', spaces) + 
                new string('*', stars));
        }
    }
}