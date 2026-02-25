import math
print("Earth 🌍 and orbiting satellite 🛰")
for i in range(0,360,30):
    rad = math.radians(i)
    x = math.cos(rad)
    y = math.sin(rad)
    orbit = ""
    for n in range(-10,11):
        orbit += "🛰" if n == round(x*10) else ("🌍" if n==0 else "·")
    print(f"{i:3}° {orbit}")