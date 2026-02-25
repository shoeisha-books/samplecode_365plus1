class Program
{
    static void Main()
    {
        var rand = new Random();
        var samples = Enumerable.Range(0, 1000)
        .Select(_ => rand.NextDouble() + rand.NextDouble() 
        + rand.NextDouble());
        var buckets = samples.GroupBy(x => (int)(x * 10))
        .OrderBy(g => g.Key)
        .Select(g => new string('*', g.Count() / 5));
        foreach (var line in buckets) Console.WriteLine(line);
    }
}
