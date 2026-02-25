R_sun = 20   # 太陽の半径
R_moon = 18  # 月の半径
dx = 8       # 月の中心の横方向オフセット

for y in range(-R_sun, R_sun+1):
    row = ""
    for x in range(-R_sun, R_sun+1):
        sun  = (x**2 + y**2 <= R_sun**2)
        moon = ((x-dx)**2 + y**2 <= R_moon**2)
        row += "#" if sun and moon else ("O" if sun else " ")
    print(row)