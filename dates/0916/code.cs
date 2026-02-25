var labels = new[] 
{ "子", "丑", "寅", "卯", "辰", "巳",
    "午", "未", "申", "酉", "戌", "亥" };
var canvas = Enumerable.Repeat(' ', 25 * 80).ToArray();
foreach (var (label, i) 
    in labels.Select((label, i) => (label,i)))
{
    var theta = i * Math.PI / 6;
    var x = (int)(10 * Math.Cos(theta) + 40);
    var y = (int)(10 * Math.Sin(theta) + 12);
    if (x is >= 0 and < 80 && y is >= 0 and < 25)
        canvas[y * 80 + x] = label[0];
}
for (int y = 0; y < 25; y++)
    Console.WriteLine(new string(canvas, y * 80, 80));