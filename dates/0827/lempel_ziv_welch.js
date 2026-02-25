/* LZW圧縮のエンコード関数 */
function lzw_encode(s) {
    let dict = {};
    // 基本的な文字（ASCII）を辞書に追加
    for (let i = 0; i < 256; i++) {
        dict[String.fromCharCode(i)] = i;
    }
    let p = "";
    let c = "";
    let result = [];
    let dictSize = 256;
    for (let i = 0; i < s.length; i++) {
        c = s.charAt(i);
        if (dict.hasOwnProperty(p + c)) {
            p = p + c;
        } else {
            result.push(dict[p]);
            dict[p + c] = dictSize++;
            p = c;
        }
    }
    if (p !== "") {
        result.push(dict[p]);
    }
    return result;
}

let original_string = "松島やああ松島や松島や";
let compressed_string = lzw_encode(original_string);
console.log("圧縮前のデータサイズ (文字数):", original_string.length);
console.log("圧縮後のデータサイズ (配列の要素数):", compressed_string.length);
console.log("圧縮率:", 
            (compressed_string.length / original_string.length * 100).toFixed(2) + "%");