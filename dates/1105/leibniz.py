def leibniz_pi(num_terms):
    if num_terms <= 0:
        return 0.0        
    # 級数の合計 (pi/4 の近似値) を初期化
    pi_over_4 = 0.0
    # 無限級数の計算を実行
    for n in range(num_terms):
        sign = 1.0 if n % 2 == 0 else -1.0
        denominator = 2 * n + 1
        term = sign / denominator        
        # pi/4 の合計に追加
        pi_over_4 += term
        if n < 5 or n == num_terms - 1:
             print(f"項 {n}: 符号={sign:.0f}, 分母={denominator}, pi/4の合計={pi_over_4:.6f}")
        elif n == 5:
             print("...")

    # 最終結果は pi = 4 * (pi/4の合計)
    pi_approx = 4 * pi_over_4    
    print(f"ライプニッツの公式による pi の近似値: {pi_approx:.10f}")
    return pi_approx

NUM_ITERATIONS = 50000
leibniz_pi(NUM_ITERATIONS)