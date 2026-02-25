braille_alphabet = {
    'A': '⠁', 'B': '⠃', 'C': '⠉', 'D': '⠙', 'E': '⠑',
    'F': '⠋', 'G': '⠛', 'H': '⠓', 'I': '⠊', 'J': '⠚',
    'K': '⠅', 'L': '⠇', 'M': '⠍', 'N': '⠝', 'O': '⠕',
    'P': '⠏', 'Q': '⠟', 'R': '⠗', 'S': '⠎', 'T': '⠞',
    'U': '⠥', 'V': '⠧', 'W': '⠺', 'X': '⠭', 'Y': '⠽',
    'Z': '⠵',
    ' ': ' ', ',': '⠂', '!': '⠖',
}

message = "HELLO, WORLD!"
braille_message = ""
for char in message:
    if char in braille_alphabet:
        braille_message += braille_alphabet[char]

print(braille_message)
# 1月4日は国際点字デー