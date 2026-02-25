def decrypt_vigenere(ciphertext, key):
    decrypted_text = ""
    key = key.upper()
    key_length = len(key)
    key_index = 0

    for char in ciphertext:
        if 'A' <= char.upper() <= 'Z':
            is_lower = char.islower()
            # 文字と鍵の文字を0-25の数値に変換
            char_code = ord(char.upper()) - ord('A')
            key_code = ord(key[key_index % key_length]) - ord('A')

            # ビジュネル暗号の解読計算式: P_i = (E_i - K_i) mod 26
            decrypted_code = (char_code - key_code + 26) % 26
            decrypted_char = chr(decrypted_code + ord('A'))

            # 鍵のインデックスを進める
            key_index += 1
        else:
            decrypted_text += char

    return decrypted_text

ciphertext = "LOORS QVU XVF TCJJHSZWRO LOIK JOPMFKAJ." # 解読したい暗号文
decryption_key = "SHOEISHA" # 暗号化に使用した鍵

# 解読して結果を表示
plaintext = decrypt_vigenere(ciphertext, decryption_key)
print(f"暗号文: {ciphertext}")
print(f"鍵: {decryption_key}")
print(f"解読されたメッセージ: {plaintext}")
