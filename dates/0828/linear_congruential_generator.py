class LinearCongruentialGenerator:
    def __init__(self, seed):
        # パラメータを設定
        self.a = 1664525
        self.c = 1013904223
        self.m = 2**32
        self.state = seed

    def generate(self):
        self.state = (self.a * self.state + self.c) % self.m
        return self.state

# 使用例
lcg = LinearCongruentialGenerator(seed=12345)

print("線形合同法による10個の擬似乱数:")
for _ in range(10):
    print(lcg.generate())