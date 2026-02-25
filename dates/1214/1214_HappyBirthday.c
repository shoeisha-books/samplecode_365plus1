#include <stdio.h> // printf, perror, exit, NULL, size_t のために必要
#include <stdlib.h> // malloc, free, exit, EXIT_FAILURE のために必要
#include <string.h> // strlen, sprintf のために必要
#include <time.h> // time_t, struct tm, time, localtime のために必要
char* create_message(int year) {
    const char* format = "ANSI C was approved %d years ago today!\n";
    size_t size = strlen(format) + 4 + 1;     
    char* message = (char*)malloc(size);
    if (message == NULL) {
        perror("Failed to allocate memory");
        exit(EXIT_FAILURE);
    }
    sprintf(message, format, year);
    return message;
}
int main() {
    time_t raw_time;
    struct tm* time_info;
    time(&raw_time);
    time_info = localtime(&raw_time);
    // 日付を判定（tm_monは0から始まるので、12月は11。tm_mdayは1から始まる）
    if (time_info->tm_mon == 11 && time_info->tm_mday == 14) {
        const int approved_year = 1989; // ANSI Cが承認された年
        int current_year = time_info->tm_year + 1900; // 現在の年を計算 (tm_yearは1900年からの経過年数なので1900を足す)
        int age = current_year - approved_year;
        char* anniversary_message = create_message(age);
        printf("%s", anniversary_message);
        free(anniversary_message);
    }    
    return 0;
}