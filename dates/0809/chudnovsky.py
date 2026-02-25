import math
from decimal import Decimal, getcontext

def calculate_pi_chudnovsky(num_terms):
    getcontext().prec = 100     
    C = 426880 * Decimal(math.sqrt(10005)) # 定数 C = 426880 * sqrt(10005)
    K = 640320 # 定数 K = 640320
    sum_val = 0    
    for n in range(num_terms):
        M = Decimal(math.factorial(6 * n)) / (Decimal(math.factorial(3 * n)) * (Decimal(math.factorial(n)) ** 3))
        L = 545140134 * n + 13591409
        X = Decimal((-1) ** n) / (Decimal(K) ** (3 * n))
        term = M * L * X        
        sum_val += term
    pi = C / sum_val # 公式より、pi = C / sum_val    
    return pi

true_pi = Decimal(math.pi)
print(f"真の円周率 {true_pi}")

# 反復回数を変えて実行し、精度の向上を確認
iterations_small, iterations_medium = 1, 100
pi_small_c = calculate_pi_chudnovsky(iterations_small)
pi_medium_c = calculate_pi_chudnovsky(iterations_medium)
print(f"項数 {iterations_small} の場合:")
print(f"  概算値: {pi_small_c}")
print(f"項数 {iterations_medium} の場合:")
print(f"  概算値: {pi_medium_c}")
