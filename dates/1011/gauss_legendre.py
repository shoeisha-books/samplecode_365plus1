import math
from decimal import Decimal, getcontext

def estimate_pi_gauss_legendre(num_iterations, precision=50):
    getcontext().prec = precision + 5    
    a = Decimal(1) # 初期値の設定
    b = Decimal(1) / Decimal(2).sqrt()  # 1 / sqrt(2)
    t = Decimal(1) / Decimal(4)         # 1 / 4
    p = Decimal(1)
    for k in range(num_iterations):
        a_next = (a + b) / 2
        b_next = (a * b).sqrt()
        t_next = t - p * (a - a_next)**2
        p_next = 2 * p        
        a, b, t, p = a_next, b_next, t_next, p_next
    estimated_pi = (a + b)**2 / (4 * t)
    return estimated_pi

# 反復回数を変えて実行し、精度の向上を確認
iterations_small, iterations_medium = 2, 4
pi_small_gl = estimate_pi_gauss_legendre(iterations_small)
pi_medium_gl = estimate_pi_gauss_legendre(iterations_medium)

true_pi = Decimal(math.pi)
print(f"真の円周率 {true_pi}")
print(f"反復回数 {iterations_small} の場合:")
print(f"  概算値: {pi_small_gl}")
print(f"反復回数 {iterations_medium} の場合:")
print(f"  概算値: {pi_medium_gl}")
