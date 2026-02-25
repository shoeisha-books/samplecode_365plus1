import re

def is_natural_text(text):
    # 平文に含まれる可能性が高い単語を列挙する
    common_words = {'the', 'be', 'to', 'of', 'and', 'a', 'in',
                    'for', 'that', 'this', 'I', 'you'}
    words = re.sub(r'[^a-zA-Z\s]', '', text).lower().split()    
    score = sum(1 for word in words if word in common_words)
    return score > 0

def caesar_cipher_decrypt(encrypted_text):
    encrypted_text = encrypted_text.lower()
    for shift in range(1, 26):
        decrypted_text = ""
        for char in encrypted_text:
            if 'a' <= char <= 'z':
                decrypted_text += chr(((ord(char) - ord('a') - shift + 26) % 26) + ord('a'))
            else:
                decrypted_text += char
        if is_natural_text(decrypted_text):
            return decrypted_text
    return "適切な解読文が見つかりませんでした。"

# 使用例
encrypted_text = 'wkdqn brx iru wbslqj lq vxfk d orqj surjudp.'
decrypted_text = caesar_cipher_decrypt(encrypted_text)
print(f"推測される元の文章: {decrypted_text}")