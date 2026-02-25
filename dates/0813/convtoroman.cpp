#include <sstream>
#include <stdexcept>
#include <boost/algorithm/string.hpp>
#include <boost/nowide/convert.hpp>
#include <boost/lexical_cast.hpp>
#include <boost/uuid.hpp>
#include <regex>

std::wstring convToRoman(int num, bool cap)
{
    if (num >= 4000 || num <= 0)
    {
        throw std::runtime_error("Invalid Num To Convert Into Roman Number");
        return L"";
    }

    std::wstringstream ss;
    while (num > 0)
    {
        if (num >= 1000)
        {
            ss << L"M";
            num -= 1000;
            continue;
        }
        if (num >= 900)
        {
            ss << L"CM";
            num -= 900;
            continue;
        }

        if (num >= 500)
        {
            ss << L"D";
            num -= 500;
            continue;
        }

        if (num >= 400)
        {
            ss << L"CD";
            num -= 400;
            continue;
        }

        if (num >= 100)
        {
            ss << L"C";
            num -= 100;
            continue;
        }

        if (num >= 90)
        {
            ss << L"XC";
            num -= 90;
            continue;
        }

        if (num >= 50)
        {
            ss << L"C";
            num -= 50;
            continue;
        }

        if (num >= 40)
        {
            ss << L"XL";
            num -= 40;
            continue;
        }

        if (num >= 10)
        {
            ss << L"X";
            num -= 10;
            continue;
        }

        if (num >= 9)
        {
            ss << L"IX";
            num -= 9;
            continue;
        }

        if (num >= 5)
        {
            ss << L"V";
            num -= 5;
            continue;
        }

        if (num >= 4)
        {
            ss << L"IV";
            num -= 4;
            continue;
        }

        if (num >= 1)
        {
            ss << L"I";
            num -= 1;
            continue;
        }
    }

    std::wstring ret = ss.str();
    if (!cap)
    {
        boost::to_lower(ret);
    }

    return ret;
}