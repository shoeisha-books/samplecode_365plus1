import time,sys
frames = ["  ___\n (o_o)\n  | |\n  |_|","  ___\n (^-^)\n  | |\n  |_|","  ___\n (O_O)\n  | |\n  |_|"]
clear = lambda: sys.stdout.write('\033[H\033[J')
for i in range(30):
    clear()
    art = frames[i%3]
    pad = ' '*(i%12)
    print('\n'.join(pad+line for line in art.split('\n')))
    time.sleep(0.15)
print("また会おう、モアイ！")