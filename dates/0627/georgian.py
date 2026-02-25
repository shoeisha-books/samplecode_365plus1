def get_georgian_number(n):
    if not (0 <= n <= 99):
        return "範囲外: 0〜99の数を入力してください。"
    # 0から19までの基本数詞
    base_numbers = [
        "nuli", "erti", "ori", "sami", "otxi", "khuti",
        "ekvsi", "shvidi", "rva", "tskhra", "ati",
        "tertmeti", "tormeti", "cameti", "totkhmeti", "txutmeti",
        "tekvsmeti", "chvidmeti", "tvrameti", "cxrameti"
    ]
    # 20、40、60、80の数詞
    tens_bases = [
        "", "oci", "ormoci", "samoci", "otkhmoci"
    ]
    if n < 20: # 0~19は基本数詞を使用する
        return base_numbers[n]
    else: # 20~99は20進法に基づいて分解する
        q = n // 20  # 20のかたまりがいくつあるか
        r = n % 20   # 残りの数（0~19）
        if n % 20 == 0: # 20で割り切れる場合、20、40、60、80の数詞を使用する
            return tens_bases[q]
        else:           # 20で割り切れない場合、20のかたまりと残りの数を組み合わせる
            return f"{tens_bases[q]}-da-{base_numbers[r]}"

print(f"3: {get_georgian_number(3)}")
print(f"15: {get_georgian_number(15)}")
print(f"21: {get_georgian_number(21)}")
print(f"47: {get_georgian_number(47)}")
print(f"60: {get_georgian_number(60)}")
print(f"83: {get_georgian_number(83)}")
print(f"99: {get_georgian_number(99)}")