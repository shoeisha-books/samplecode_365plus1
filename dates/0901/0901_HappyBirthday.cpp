#include <iostream>
#include <vector>
#include <string>
#include <ctime>
#include <algorithm>

class PrintString {
public:
    void operator()(const std::string& s) const {
        std::cout << s << " ";
    }
};

int main() {
    // 現在の日付を取得（ctimeを使用）
    std::time_t now = std::time(0);
    std::tm* local_time = std::localtime(&now);

    // tm_monは0から始まるので、9月は8
    if (local_time->tm_mon == 8 && local_time->tm_mday == 1) {
        std::vector<std::string> messages;
        messages.push_back("9月1日はC++98が発行された日です！");

        std::for_each(messages.begin(), messages.end(), PrintString());
        std::cout << std::endl;

    } else {
        std::cout << "今日はC++98の誕生日ではありません。" << std::endl;
    }

    return 0;
}