def get_german_number(n):
    if not (0 <= n <= 99):
        return "範囲外: 0〜99の数を入力してください。"
    units_and_teens = {
        0: "null", 1: "eins", 2: "zwei", 3: "drei", 4: "vier", 
        5: "fünf", 6: "sechs", 7: "sieben", 8: "acht", 9: "neun",
        10: "zehn", 11: "elf", 12: "zwölf", 13: "dreizehn", 14: "vierzehn",
        15: "fünfzehn", 16: "sechzehn", 17: "siebzehn", 18: "achtzehn", 19: "neunzehn"
    }    
    tens = {
        20: "zwanzig", 30: "dreißig", 40: "vierzig", 50: "fünfzig", 
        60: "sechzig", 70: "siebzig", 80: "achtzig", 90: "neunzig"
    }
    if n in units_and_teens: # 0~19
        return units_and_teens[n]
    # 20以上
    unit = n % 10  # 一の位
    ten_value = (n // 10) * 10 # 十の位 (20, 30, ...)
    if unit == 0: # 一の位が0の場合 (20, 30, ..., 90)
        return tens[ten_value]
    unit_word = units_and_teens[unit]
    if unit == 1: # 一の位が0の場合、einsではなくein
        unit_word = "ein"         
    ten_word = tens[ten_value]
    return f"{unit_word}und{ten_word}"

print(f"5: {get_german_number(5)}")
print(f"12: {get_german_number(12)}")
print(f"20: {get_german_number(20)}")
print(f"34: {get_german_number(34)}")
print(f"77: {get_german_number(77)}")
print(f"99: {get_german_number(99)}")
