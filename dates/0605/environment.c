#include <stdio.h>

int main()
{
    int earth=50,i;
    for(i=0; i<5; i++)
    {
        printf("Earth HP:%d\n", earth);
        earth -= 5;                     // 汚染で減る
        if(i==2)
        {
            earth += 15;
            printf("Protect nature! Earth heals.\n");
        }
    }
    printf("Final Earth HP:%d\nSave our Planet!\n", earth);
    return 0;
}
