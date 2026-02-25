def get_french_between_70_and_99(n, dix, unit):
    # 0〜19の単語
    UNITS = ["zéro", "un", "deux", "trois", "quatre", "cinq", "six", 
             "sept", "huit", "neuf", "dix", "onze", "douze", "treize", 
             "quatorze", "quinze", "seize", "dix-sept", "dix-huit",
             "dix-neuf"]    
    if 70 <= n <= 79:  # 70台は60+10~19で表現する
        if n == 70:
            return "soixante-dix"
        elif n == 71:
            return "soixante-et-onze" # 例外: et を使用
        else:
            return "soixante-" + UNITS[n - 60]
    if 80 <= n <= 89: # 80台は4*20+0~9で表現する
            base = "quatre-vingt"
            if n == 80:
                return "quatre-vingts" # s が付く例外
            else:
                return base + "-" + UNITS[unit] # 81 は 'et' なし
    if 90 <= n <= 99: # 90台は4*20+10~19で表現する
        return "quatre-vingt-" + UNITS[n - 80]
