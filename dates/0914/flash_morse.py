from machine import Pin
import time
import hiragana_to_morse

# モールス信号の点滅時間 (秒)
DOT_TIME = 1					# 短点 (・)
DASH_TIME = DOT_TIME * 3		# 長点 (－)
ELEMENT_SPACE = DOT_TIME		# 要素 (短点/長点)間の間隔 
CHAR_SPACE = DOT_TIME * 7		# 文字間の間隔

def flash_morse_code(morse_string, led):
    for i, char in enumerate(morse_string):
        if char == '・':
            led.value(1) # LED ON
            time.sleep(DOT_TIME)
            led.value(0) # LED OFF
            time.sleep(ELEMENT_SPACE) # 要素間の間隔
        elif char == '－':
            led.value(1) # LED ON
            time.sleep(DASH_TIME)
            led.value(0) # LED OFF
            time.sleep(ELEMENT_SPACE) # 要素間の間隔
        elif char == ' ':
            if i > 0 and morse_string[i-1] != ' ': # 連続するスペースや最初・最後でなければ
                time.sleep(CHAR_SPACE - ELEMENT_SPACE)
    led.value(0)

led = Pin('LED', Pin.OUT) 
hiragana_input = "とと゛まれ"
morse_output = hiragana_to_morse.to_morse_code(hiragana_input)
print(f"モールス信号: {morse_output}")

while True:
    print("モールス信号の点滅を開始します...")
    flash_morse_code(morse_output, led)
    print("点滅が完了しました。")