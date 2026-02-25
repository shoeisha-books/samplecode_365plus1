class MersenneTwister:
    def __init__(self, seed):
        # 状態配列と定数
        self.state = [0] * 624
        self.index = 0
        self.state[0] = seed
        
        # 初期化
        for i in range(1, 624):
            prev = self.state[i-1]
            # 32ビットの整数範囲で操作
            self.state[i] = (1812433253 * (prev ^ (prev >> 30)) + i) & 0xFFFFFFFF

    def twist(self):
        # 捻り（Twisting）
        for i in range(624):
            y = (self.state[i] & 0x80000000) + (self.state[(i + 1) % 624] & 0x7FFFFFFF)
            self.state[i] = self.state[(i + 397) % 624] ^ (y >> 1)
            if y % 2 != 0:
                self.state[i] ^= 0x9908B0DF

    def generate(self):
        # テンパリング（Tempering）
        if self.index == 0:
            self.twist()
        y = self.state[self.index]
        y ^= (y >> 11)
        y ^= ((y << 7) & 0x9D2C5680)
        y ^= ((y << 15) & 0xEFC60000)
        y ^= (y >> 18)
        self.index = (self.index + 1) % 624
        return y & 0xFFFFFFFF

# 使用例
mt = MersenneTwister(seed=123)
print("メルセンヌ・ツイスター法による10個の擬似乱数:")
for _ in range(10):
    print(mt.generate())
