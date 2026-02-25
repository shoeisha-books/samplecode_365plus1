import hashlib

def calculate_sha256_hash(input_string):
    encoded_string = input_string.encode('utf-8')
    sha256_hash = hashlib.sha256()
    sha256_hash.update(encoded_string)
    return sha256_hash.hexdigest()

user_input = input("ハッシュ化したい文字列を入力してください: ")
hashed_value = calculate_sha256_hash(user_input)

print("\n--- SHA-256ハッシュ化の結果 ---")
print(f"元の文字列: {user_input}")
print(f"ハッシュ値: {hashed_value}")
