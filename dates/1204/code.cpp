#include <iostream>
#include <string>

int main() {
    int year, month, day;
    std::cout << "Input Year: ";
    std::cin >> year;
    std::cout << "Input Month: ";
    std::cin >> month;
    std::cout << "Input Day: ";
    std::cin >> day;

    if (month < 3) {
        month += 12;
        year--;
    }
    int dayOfMonth = day;
    int yearLast2Digits = year % 100;
    int yearFirst2Digits = year / 100;

    int date = dayOfMonth + (13 * (month + 1)) / 5 + yearLast2Digits + (yearLast2Digits / 4)
            + (yearFirst2Digits / 4) - 2 * yearFirst2Digits;

    date = (date % 7 + 7) % 7;

    std::string daysOfWeek[] = {"Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"};
    std::cout << "The day of the week is: " << daysOfWeek[date] << std::endl;

    return 0;
}