from opencc import OpenCC

# 簡体字から繁体字への変換
cc = OpenCC('s2t')
simplified_text = "中国"
traditional_text = cc.convert(simplified_text)
print(f"簡体字: {simplified_text}")
print(f"繁体字: {traditional_text}")
# 出力例: 簡体字: 中国, 繁体字: 中國

# 繁体字から簡体字への変換
cc = OpenCC('t2s')
traditional_text = "台灣"
simplified_text = cc.convert(traditional_text)
print(f"繁体字: {traditional_text}")
print(f"簡体字: {simplified_text}")
# 出力例: 繁体字: 台灣, 簡体字: 台湾
# 4月20日は国際中国語デー