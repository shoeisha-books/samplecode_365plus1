def rot13(text):
    result = ""
    for char in text:
        if 'A' <= char <= 'Z':
            new_char_code = ord(char) + 13
            # 'Z'を超えたら'A'に戻るように調整
            if new_char_code > ord('Z'):
                new_char_code -= 26
            result += chr(new_char_code)
        elif 'a' <= char <= 'z':
            new_char_code = ord(char) + 13
            # 'z'を超えたら'a'に戻るように調整
            if new_char_code > ord('z'):
                new_char_code -= 26
            result += chr(new_char_code)
        else:
            result += char
    return result

# 実行例
user_input = "FCBVYRE: Qnegu Inqre vf Yhxr’f sngure."
print(f"平文: {user_input}")
rot13_once = rot13(user_input)
print(f"ROT13で変換: {rot13_once}")
rot13_twice = rot13(rot13_once)
print(f"ROT13で再変換: {rot13_twice}")
