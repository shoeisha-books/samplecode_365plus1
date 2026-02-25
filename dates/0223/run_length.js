/* ランレングス符号化（RLE）のエンコード関数 */
function rle_encode(s) {
    if (s.length === 0) {
        return "";
    }
    let result = "";
    let count = 1;
    let currentChar = s[0];
    for (let i = 1; i <= s.length; i++) {
        if (s[i] === currentChar) {
            count++;
        } else {
            result += count + currentChar;
            if (i < s.length) {
                currentChar = s[i];
                count = 1;
            }
        }
    }
    return result;
}

// 使用例
const original_string = "aaabbbbccdddd";
const compressed_string = rle_encode(original_string);
console.log("圧縮前のデータサイズ (文字数):", original_string.length);
console.log("圧縮後のデータサイズ (文字数):", compressed_string.length);
console.log("圧縮率:", (compressed_string.length / original_string.length * 100).toFixed(2) + "%");