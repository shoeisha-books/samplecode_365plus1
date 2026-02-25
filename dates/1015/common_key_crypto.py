from cryptography.fernet import Fernet

# 共通鍵の生成
key = Fernet.generate_key()
print(f"生成された共通鍵: {key.decode()}")
# 平文を定義して暗号化
message = "テストメッセージ"
message_bytes = message.encode()
f = Fernet(key)
ciphertext = f.encrypt(message_bytes)
print(f"暗号文: {ciphertext}")

# 共通鍵を使用して暗号文を復号
decrypted_message_bytes = f.decrypt(ciphertext)
decrypted_message = decrypted_message_bytes.decode()
print(f"復号されたメッセージ: {decrypted_message}")

# 復号されたメッセージが元の平文と一致することを確認
assert message == decrypted_message
print("検証成功！復号されたメッセージは元の平文と一致します。")