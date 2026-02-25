import french_0321

def get_french_number(n):
    if not (0 <= n <= 99):
        return "範囲外: 0〜99の数を入力してください。"
    dix, unit = n // 10, n % 10
    # 0〜16の単語 (暗記が必要な部分)
    UNITS = ["zéro", "un", "deux", "trois", "quatre", "cinq", "six", 
             "sept", "huit", "neuf", "dix", "onze", "douze", "treize", 
             "quatorze", "quinze", "seize"]    
    # 20, 30, 40, 50, 60 の十の位
    TENS = ["", "", "vingt", "trente", "quarante", "cinquante", "soixante"]
    if n < 17: # 0~16
        return UNITS[n]
    if 17 <= n <= 19: # 17~19
        return "dix-" + UNITS[unit]
    if 20 <= n <= 69:
        if unit == 0:
            return TENS[dix]
        elif unit == 1:
            return TENS[dix] + "-et-un" # 例外: et を使用
        else:
            return TENS[dix] + "-" + UNITS[unit]
    if 70 <= n:
        return french_0321.get_french_between_70_and_99(n, dix, unit)

print(f"16: {get_french_number(16)}")
print(f"60: {get_french_number(60)}")
print(f"71: {get_french_number(71)}")
print(f"81: {get_french_number(81)}")
print(f"99: {get_french_number(99)}")