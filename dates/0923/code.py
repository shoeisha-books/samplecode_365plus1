from datetime import date, datetime

def calc(k, y):
    m, d = {"春分": (3, 20.8431), "秋分": (9, 23.2488), "夏至": (6, 21.447), "冬至": (12, 22.2747)}[k]
    return date(y, m, int(d + 0.242194 * (y - 1980)) - int((y - 1980) / 4))

def confirm(msg):
    while True:
        a = input(msg).strip().lower()
        if a in ("y", "n"): return a == "y"
        print("⚠️ y または n を入力してください。")

print("このプログラムは1980〜2099年の節気を計算します")
kinds = {"1": "春分", "2": "秋分", "3": "夏至", "4": "冬至"}

while True:
    y_in = input("年を入力（空欄で今年、0で終了）：").strip()
    if y_in == "0":
        if confirm("終了しますか？（y/n）："): print("\nプログラムを終了します。お疲れさまでした。\n"); break
        else: continue
    try: y = datetime.now().year if y_in == "" else int(y_in)
    except: print("⚠️ 数字で入力してください。"); continue
    if not (1980 <= y <= 2099):
        print("⚠️ 入力された年は対象外です。\nこのプログラムは1980〜2099年の節気を計算します。"); continue

    while True:
        k = input("節気を選択：1春分 2秋分 3夏至 4冬至 9すべて 0終了\n→ 半角数字で入力：").strip()
        if k == "": print("⚠️ 節気を選択してください。"); continue
        if k == "0":
            if confirm("終了しますか？（y/n）："): print("\nプログラムを終了します。お疲れさまでした。\n"); exit()
            else: continue
        if k in kinds:
            print(f"{y}年の{kinds[k]}は {calc(kinds[k], y).strftime('%Y年%m月%d日')}")
            if confirm("別の節気も調べますか？（y/n）："): continue
            if not confirm("別の年も調べますか？（y/n）："): print("\nプログラムを終了します。お疲れさまでした。\n"); exit()
            else: break
        elif k == "9":
            for kind in kinds.values(): print(f"{kind}：{calc(kind, y).strftime('%Y年%m月%d日')}")
            if not confirm("別の年も調べますか？（y/n）："): print("\nプログラムを終了します。お疲れさまでした。\n"); exit()
            else: break
        else: print("⚠️ 1〜4 または 9 を選んでください。")