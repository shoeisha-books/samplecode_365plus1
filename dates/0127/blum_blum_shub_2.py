def blum_blum_shub(num_bits):
    p, q = find_blum_primes()
    print(f"p: {p}, q: {q}")
    n = p * q
    print(f"n = p * q = {n}")
    # シード（初期値）の設定
    s = 100  # 任意の初期値
    while not (1 < s < n) or (s % p == 0) or (s % q == 0):
        s += 1
    x = s
    print(f"シード（初期値）: {x}")
    # シーケンスの生成
    random_bits = ""
    for i in range(num_bits):
        x = (x * x) % n
        # 最下位ビットを取得
        bit = x % 2
        random_bits += str(bit)
        print(f"ステップ {i+1}: x = {x}, ビット = {bit}")
    return random_bits

# 10ビットの擬似乱数を生成
generated_bits = blum_blum_shub(10)
print(f"生成された10ビットの擬似乱数: {generated_bits}")