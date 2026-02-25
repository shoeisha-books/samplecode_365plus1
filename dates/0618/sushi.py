s = input("最初のすしネタをどうぞ: ")
while True:
    n = input("次のネタ: ")
    if n[0] != s[-1]:
        print("しりとり失敗！"); break
    print("いいですね！続きます。")
    s = n