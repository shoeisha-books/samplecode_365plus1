class Xorshift32:
    def __init__(self, seed):
        # 状態変数を初期化
        if seed == 0:
            # シード値が0の場合、乱数生成が機能しないため、別の値に設定
            self.state = 1
        else:
            self.state = seed

    def generate(self):
        x = self.state
        x ^= (x << 13) & 0xFFFFFFFF
        x ^= (x >> 17) & 0xFFFFFFFF
        x ^= (x << 5) & 0xFFFFFFFF
        self.state = x
        return x

# 使用例
xorshift = Xorshift32(seed=12345)

print("Xorshift法による10個の擬似乱数:")
for _ in range(10):
    print(xorshift.generate())