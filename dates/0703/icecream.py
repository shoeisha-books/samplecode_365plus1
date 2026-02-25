# ソフトクリームの日：味を選ぼう
flavors = ["バニラ", "チョコ", "いちご", "抹茶", "マンゴー"]
print("ソフトクリームを選んでね！")
for i, f in enumerate(flavors):
    print(i, f)
choice = input("番号を入力→ ")
if choice.isdigit() and 0 <= int(choice) < len(flavors):
    print("あなたが選んだ味：", flavors[int(choice)], "♥")
else:
    print("その味は売り切れです…")