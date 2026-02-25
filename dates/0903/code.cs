    static void Main()
    {
        int width = 20, height = 10;
        (int x, int y)[] stars = { (2, 2), (5, 7), (8, 2), (11, 7), (14, 2) };
        var starSet = new HashSet<(int, int)>(stars);
        var lines = new HashSet<(int, int)>();
        void AddLine((int x, int y) a, (int x, int y) b){
            var (x0, y0) = a;
            var (x1, y1) = b;
            int dx = Math.Abs(x1 - x0), dy = Math.Abs(y1 - y0);
            int sx = x0 < x1 ? 1 : -1, sy = y0 < y1 ? 1 : -1, err = dx - dy;
            while (true){
                if ((x0, y0) != a && (x0, y0) != b) lines.Add((x0, y0));
                if (x0 == x1 && y0 == y1) break;
                int e2 = err * 2;
                if (e2 > -dy) { err -= dy; x0 += sx; }
                if (e2 < dx) { err += dx; y0 += sy; }
            }
        }
        for (int i = 0; i < stars.Length - 1; i++) AddLine(stars[i], stars[i + 1]);
        for (int y = 0; y < height; y++){
            for (int x = 0; x < width; x++)
                Console.Write(starSet.Contains((x, y)) ? '*' : lines.Contains((x, y)) ? '-' : ' ');
            Console.WriteLine();
        }
    }
