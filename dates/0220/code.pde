int width = 25, height = 25, cellSize = 20;
boolean[][] maze = new boolean[width][height];
void setup() {
    size(500, 500);
    generateMaze(1, 1);
}
void generateMaze(int x, int y) {
    maze[x][y] = true;
    int[] dx = {0, 2, 0, -2}, dy = {-2, 0, 2, 0};
    for (int i = 0; i < 4; i++) {
    int r = (int)random(4);
    int tx = dx[i]; dx[i] = dx[r]; dx[r] = tx;
    int ty = dy[i]; dy[i] = dy[r]; dy[r] = ty;
    }
    for (int i = 0; i < 4; i++) {
    int nx = x + dx[i], ny = y + dy[i];
    if (nx > 0 && nx < width-1 && ny > 0 && ny < height-1 && !maze[nx][ny]) {
        maze[x + dx[i]/2][y + dy[i]/2] = true;
        generateMaze(nx, ny);
    }
    }
}
void draw() {
    background(255);
    for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
        fill(maze[x][y] ? 255 : 0);
        rect(x * cellSize, y * cellSize, cellSize, cellSize);
    }
    }
}