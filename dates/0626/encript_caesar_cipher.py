def caesar_cipher(text, shift=3):
    """
    Args:
        text (str): 暗号化する文字列。
        shift (int): 文字をずらす数。デフォルトは3。
    Returns:
        str: 暗号化された文字列。
    """
    result = ""
    for char in text:
        if 'A' <= char <= 'Z':
            # 文字をシフトし、'A'からの相対位置を計算して、'Z'を超えた場合は'A'に戻す
            result += chr(((ord(char) - ord('A') + shift) % 26) + ord('A'))
        elif 'a' <= char <= 'z':
            # 文字をシフトし、'a'からの相対位置を計算して、'z'を超えた場合は'a'に戻す
            result += chr(((ord(char) - ord('a') + shift) % 26) + ord('a'))
        else:
            # アルファベット以外の文字（数字、記号など）はそのまま追加
            result += char
    return result

# ユーザーに文字列の入力を促す
user_input = input("暗号化したい文字列を入力してください: ")

# プログラムを実行して結果を表示
encrypted_text = caesar_cipher(user_input)
print(f"暗号化された文字列: {encrypted_text}")