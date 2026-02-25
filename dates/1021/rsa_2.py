import rsa_1
import math
import random
import hashlib

def sign(private_key, message):
    """秘密鍵でメッセージに署名"""
    exponent, modulus = private_key
    hash_value = int(hashlib.sha256(message.encode('utf-8')).hexdigest(), 16) % modulus
    signature = pow(hash_value, exponent, modulus)
    return signature

def verify(public_key, message, signature):
    """公開鍵で署名を検証"""
    exponent, modulus = public_key
    decrypted_hash = pow(signature, exponent, modulus)
    original_hash = int(hashlib.sha256(message.encode('utf-8')).hexdigest(), 16) % modulus
    return decrypted_hash == original_hash

if __name__ == '__main__':
    p, q = 61, 53
    public_key, private_key = rsa_1.generate_key_pair(p, q)
    print(f"公開鍵:{public_key}, 秘密鍵:{private_key}")
    message = "Hello, RSA Digital Signature!"
    print("元のメッセージ:", message)
    signature = sign(private_key, message)
    print("作成された署名:", signature)
    is_valid = verify(public_key, message, signature)
    print("署名が有効か:", "有効" if is_valid else "無効")
    tampered_message = "Hello, RSA Digital Signature! (modified)"
    is_valid_tampered = verify(public_key, tampered_message, signature)
    print("改ざんされたメッセージの検証:", "有効" if is_valid_tampered else "無効")
