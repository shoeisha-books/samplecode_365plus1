from cryptography.hazmat.backends import default_backend
from cryptography.hazmat.primitives import hashes, serialization
from cryptography.hazmat.primitives.asymmetric import rsa, padding

# 受信者が公開鍵と秘密鍵のペアを生成
private_key = rsa.generate_private_key(
    public_exponent=65537,
    key_size=2048,
    backend=default_backend())
public_key = private_key.public_key()
# 公開鍵をPEM形式の文字列に変換して出力
public_key_pem = public_key.public_bytes(
    encoding=serialization.Encoding.PEM,
    format=serialization.PublicFormat.SubjectPublicKeyInfo)
print(f"公開鍵（PEM形式）:{public_key_pem.decode()}")
# 送信者が受信者の公開鍵を使ってメッセージを暗号化
message = b"This is a secret message."
encrypted = public_key.encrypt(
    message,
    padding.OAEP(
        mgf=padding.MGF1(algorithm=hashes.SHA256()),
        algorithm=hashes.SHA256(), label=None))
print(f"暗号文: {encrypted}")
# 受信者が秘密鍵を使って暗号文を復号
decrypted = private_key.decrypt(
    encrypted,
    padding.OAEP(
        mgf=padding.MGF1(algorithm=hashes.SHA256()),
        algorithm=hashes.SHA256(), label=None))
print(f"復号されたメッセージ: {decrypted.decode()}")
# 復号されたメッセージが元の平文と一致することを確認
assert message == decrypted
print("検証成功！復号されたメッセージは元の平文と一致します。")