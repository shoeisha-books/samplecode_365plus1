year = int(input("Year? "))
print("Gregorian calendar leap year check")
print("Leap if divisible by 4")
print("but not by 100, unless by 400.")
leap = (year % 4 == 0 and (year % 100 != 0 or year % 400 == 0))
kind = "leap year" if leap else "common year"
print(year, "is a", kind)
print("Nearby leap years:")
for y in range(year - 10, year + 11):
    if (y % 4 == 0 and (y % 100 != 0 or y % 400 == 0)): print(y, end=" ")