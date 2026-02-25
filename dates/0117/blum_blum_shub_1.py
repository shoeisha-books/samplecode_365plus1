def is_prime(num):
    if num < 2:
        return False
    for i in range(2, int(num**0.5) + 1):
        if num % i == 0:
            return False
    return True

def find_blum_primes(k=10000):
    p, q = 0, 0
    # 例示のため10000以下の素数を使っていますが
    # 実際の暗号ではもっと大きな素数が使われます
    for num in range(k, 1, -1):
        if is_prime(num) and (num % 4 == 3):
            if p == 0:
                p = num
            elif q == 0 and num != p:
                q = num
                break
    return p, q
