#include <conio.h>
#include <print>
#include <stdlib.h>
#include <Windows.h>
int main() {
    srand(time(nullptr)); constexpr int k_width = 16, k_height = 16;
    const char* area[k_width][k_height];
    int px = k_width / 2, tx = 0, ty = -1, ax = 0, ay = -1, timer = 0, score = 0, gameOver = 0;
    while (true) {
        if (_kbhit()) {
            int ch = _getch(); if (ch == 100) if (px < (k_width - 1)) ++px; if (ch == 97) if (px > 0) --px; if (ch == 27) break;
        } if (timer % 20 == 0) {
            if (ay == -1) { ax = rand() % k_width; ay = 0; } if (ty == -1) { tx = rand() % k_width; ty = 0; }
        }
        if (ay != -1) { if (timer % 2 == 0) ++ay; } if (ty != -1) { if (timer % 4 == 0) ++ty; }
        for (int h = 0; h < k_height; ++h) {
            for (int w = 0; w < k_width; ++w) {
                if (h == (k_height - 1) && w == px) area[w][h] = "P"; else if (h == ay && ax == w) area[w][h] = "A"; else if (h == ty && tx == w) area[w][h] = "*"; else area[w][h] = ".";
                std::print("{}", area[w][h]);
            } std::print("\n");
        } if (ax == px && ay == (k_height - 1)) { ++score; ay = -1; } if (tx == px && ty == (k_height - 1)) { gameOver = 1; ty = -1; } if (ty > k_height) ty = -1; if (ay > k_height) ay = -1;
        std::print("Move: A,D. Exit: ESC, Score: {}\n", score);
        if (gameOver == 1) { std::print("GAMEOVER\nPress Any Key To Restart."); int ch = _getch(); gameOver = 0; score = 0; px = k_width / 2; ty = -1; ay = -1; }
        Sleep(60); system("cls"); ++timer;
    }
    return 0;
}