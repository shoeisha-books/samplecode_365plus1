import random

def select_items_within_budget(budget):
    wish_list = {
        "独習Python 第2版": 3608,
        "Think Fast, Talk Smart": 1980,
        "G検定 公式テキスト 第3版": 3080,
        "あたらしい近代服飾史の教科書": 4620,
    }
    purchased_items = {}
    total_cost = 0

    items_to_buy = list(wish_list.keys())
    random.shuffle(items_to_buy)
    for item in items_to_buy:
        price = wish_list[item]
        if total_cost + price <= budget:
            purchased_items[item] = price
            total_cost += price
    return purchased_items, total_cost

if __name__ == "__main__":
    try:
        user_budget = float(input("予算を入力してください（例：10000）: "))
        if user_budget <= 0:
            print("予算は正の数で入力してください。")
        else:
            selected_items, total_price = select_items_within_budget(user_budget)
            print(f"\n {int(user_budget)}円の予算で購入できるものリスト")
            if selected_items:
                for item, price in selected_items.items():
                    print(f"- {item}: {price}円")
                print(f" 合計金額: {total_price}円")
            else:
                print("その予算で購入できる商品はありませんでした。")
    except ValueError:
        print("無効な入力です。数値を入力してください。")