import math
from decimal import Decimal, getcontext

def calculate_arctan_series(x_val, num_terms):
    sum_series = Decimal(0)
    x = Decimal(x_val)
    for n in range(num_terms):
        power = 2 * n + 1               # べき乗の指数 (1, 3, 5, ...)
        term = x ** power / power       # x^(2n+1) / (2n+1)
        sign = 1 if n % 2 == 0 else -1
        sum_series += sign * term            
    return sum_series

def estimate_pi_machin(num_terms, precision=50):
    getcontext().prec = precision + 5
    # マチンの公式: pi/4 = 4 * arctan(1/5) - arctan(1/239)    
    arctan_1_over_5 = calculate_arctan_series(Decimal(1) / Decimal(5), num_terms)
    arctan_1_over_239 = calculate_arctan_series(Decimal(1) / Decimal(239), num_terms)
    pi_over_4 = 4 * arctan_1_over_5 - arctan_1_over_239
    estimated_pi = 4 * pi_over_4
    return estimated_pi

terms_small, terms_medium = 10, 1000000 # 級数の項の数を2パターン設定（大きいほど精度が向上する）

pi_small_machin = estimate_pi_machin(terms_small)
pi_medium_machin = estimate_pi_machin(terms_medium)

true_pi = Decimal(math.pi)
print(f"真の円周率 {true_pi}")
print(f"級数の項数 {terms_small} の場合:")
print(f"  概算値: {pi_small_machin}")
print(f"級数の項数 {terms_medium} の場合:")
print(f"  概算値: {pi_medium_machin}")