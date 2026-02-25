#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <conio.h>
time_t start, end;
double elapsed;
int main(void) {
    int restart;
    printf("\n\n\n　　　　 レジ打ちシミュレーター\n　　 　～プロアルバイターへの道～\n\n        PRESS　ANY KEY TO START");
    restart = _getch();
    system("cls");
    srand((unsigned int)time(NULL)); // 現在時刻の情報で初期化
    int sum, cus;
    unsigned int player;
    int sumcus;
    start:
    sum = rand() % 10000 + 1;
    cus = rand() % 10000 + 1;
    if (sum > cus)
    {
        for (int i = 0; i < sum; i++) {
            cus = rand() % 10000 + 1;
            if (sum < cus) {
                break;
            }
        }
    }
    start = time(NULL);
    printf("            お会計金額%d円\n       お客さんが出した金額%d円\n", sum, cus);
    printf("            おつりはいくら？\n金額を入力　");
    scanf_s("%d円", &player);