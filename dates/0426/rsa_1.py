import math
import random

def generate_key_pair(p, q):
    modulus = p * q
    phi = (p - 1) * (q - 1)
    public_exponent = random.randrange(2, phi)
    g = math.gcd(public_exponent, phi)
    while g != 1:
        public_exponent = random.randrange(2, phi)
        g = math.gcd(public_exponent, phi)
    private_exponent = pow(public_exponent, -1, phi)
    return ((public_exponent, modulus), (private_exponent, modulus))

def encrypt_rsa(pk, plaintext):
    key, n = pk
    cipher = [(ord(char) ** key) % n for char in plaintext]
    return cipher

def decrypt_rsa(sk, ciphertext):
    key, n = sk
    plain = [chr((char ** key) % n) for char in ciphertext]
    return ''.join(plain)

if __name__ == '__main__':
    p, q = 61, 53  # 任意の素数の組
    public_key, private_key = generate_key_pair(p, q) # 鍵ペアの生成
    print(f"公開鍵:{public_key}, 秘密鍵:{private_key}")
    message = "Hello, RSA!"
    print("\n元のメッセージ:", message)
    encrypted_msg = encrypt_rsa(public_key, message) # 公開鍵で暗号化
    print("暗号化されたメッセージ:", encrypted_msg)
    decrypted_msg = decrypt_rsa(private_key, encrypted_msg) # 秘密鍵で復号
    print("復号されたメッセージ:", decrypted_msg)
