import hiragana_to_morse

def morse_to_hiragana(morse_code_text):
    MORSE_TO_HIRAGANA = {v: k for k, v in hiragana_to_morse.HIRAGANA_TO_MORSE.items()}
    morse_codes = morse_code_text.strip().split(' ')

    hiragana_result = []
    for code in morse_codes:
        if not code:
            continue
        if code in MORSE_TO_HIRAGANA:
            hiragana = MORSE_TO_HIRAGANA[code]
            hiragana_result.append(hiragana)
        else:
            print(f"警告: モールス符号 '{code}' に対応するひらがなが定義されていません。スキップします。")
            continue            
    return ''.join(hiragana_result)

if __name__ == "__main__":
    morse_input = "・－・・ ・－ －・－ －・・・ －・・－ －・－・・ －・・－ －・－・ －・－・・ ・－・・ －－－ ・－・－－ ・－ －・－－・"
    hiragana_output = morse_to_hiragana(morse_input)
    print(f"ひらがな: {hiragana_output}")