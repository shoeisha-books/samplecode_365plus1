def vigenere_cipher(message, key):
    encrypted_text = ""
    key = key.upper()
    key_length = len(key)
    key_index = 0

    for char in message:
        # アルファベット（A-Z, a-z）のみを暗号化
        if 'A' <= char.upper() <= 'Z':
            # 文字と鍵の文字を0-25の数値に変換
            char_code = ord(char.upper()) - ord('A')
            key_code = ord(key[key_index % key_length]) - ord('A')
            # ビジュネル暗号の計算式: E_i = (P_i + K_i) mod 26
            encrypted_code = (char_code + key_code) % 26
            encrypted_char = chr(encrypted_code + ord('A'))
            encrypted_text += encrypted_char
            
            # 鍵のインデックスを進める
            key_index += 1
        else:
            # アルファベット以外の文字はそのまま追加
            encrypted_text += char

    return encrypted_text

# ユーザーからの入力を取得
plaintext = input("暗号化したいメッセージを入力してください: ")
encryption_key = input("暗号化の鍵を入力してください: ")
# 暗号化して結果を表示
ciphertext = vigenere_cipher(plaintext, encryption_key)
print(f"暗号化されたメッセージ: {ciphertext}")