def lagged_fibonacci_generator(a, b, m, seed_list, n_samples):
    random_numbers = seed_list[:b]
    # 指定された数の乱数を生成
    for i in range(b, n_samples + b):
        # ラグaとbの位置にある要素を取得
        term1 = random_numbers[i - a]
        term2 = random_numbers[i - b]
        # 新しい乱数を計算
        new_number = (term1 + term2) % m
        # 新しい乱数をリストに追加
        random_numbers.append(new_number)
    return random_numbers[b:] # シード値を除いたリストを返す

# 使用例
a_val, b_val, m_val = 7, 10, 2**32
seed_data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
num_to_generate = 20
generated_list = lagged_fibonacci_generator(
    a=a_val, b=b_val, m=m_val, seed_list=seed_data,
    n_samples=num_to_generate)
print(generated_list)