import random
import math

def estimate_pi_montecarlo(num_trials):
    points_in_circle = 0 # 円の内部に入った点の数
    for _ in range(num_trials): # 試行回数だけループを繰り返す
        x = random.uniform(-1, 1) # 一辺の長さが2の正方形内の……
        y = random.uniform(-1, 1) # ……ランダムな位置に点を打つ
        # 原点からの距離を計算して、点が正方形に内接する円の内部にあるか判定
        distance_squared = x**2 + y**2        
        if distance_squared <= 1:
            points_in_circle += 1
    # 正方形の面積と円の内部にある点の数から、円周率を概算
    estimated_pi = 4 * (points_in_circle / num_trials)     
    return estimated_pi

# 精度が向上することを確認できるよう試行回数を変えて実行
trials_small = 1000
trials_medium = 100000
trials_large = 1000000
pi_small = estimate_pi_montecarlo(trials_small)
pi_medium = estimate_pi_montecarlo(trials_medium)
pi_large = estimate_pi_montecarlo(trials_large)

print(f"試行回数 {trials_small} の場合:")
print(f"  概算値: {pi_small}")
print(f"試行回数 {trials_medium} の場合:")
print(f"  概算値: {pi_medium}")
print(f"試行回数 {trials_large} の場合:")
print(f"  概算値: {pi_large}")
