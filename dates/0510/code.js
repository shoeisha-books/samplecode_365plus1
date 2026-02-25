const exp = new Uint8Array(256), log = new Uint8Array(256);
let p = 1;
for (let i = 0; i < 255; i++) {
    exp[i] = p; log[p] = i; p <<= 1;
    if (p & 0x100) p ^= 0x11d;
}
const mul = (a, b) => a === 0 || b === 0 ? 0 : exp[(log[a] + log[b]) % 255];
const mulPoly = (p1, p2) => {
    const r = new Uint8Array(p1.length + p2.length - 1);
    for (let i = 0; i < p1.length; i++)
        for (let j = 0; j < p2.length; j++)
            r[i + j] ^= mul(p1[i], p2[j]);
    return r;
};
const encodeRS = (data, eclen) => {
    let gx = [1];
    for (let i = 0; i < eclen; i++)
        gx = mulPoly(gx, [1, exp[i]]);
    const mx = new Uint8Array(data.length + eclen);
    mx.set(data);
    for (let i = 0; i < data.length; i++) {
        const m = mx[i];
        if (m === 0) continue;
        for (let j = 0; j < gx.length; j++)
            mx[i + j] ^= mul(m, gx[j]);
    }
    mx.set(data);
    return mx;
};
console.log(encodeRS(new TextEncoder().encode('\u{1f9ed}CodeZine'), 2));
// 2D symbol
const size = 21; // version 1
const format = 0x5125; // ECC level M, masking 001
const n = 26, k = 16; // (n, k) code
const qr = Array.from({ length: size }, () => new Uint8Array(size).fill(2));
// encoding
const utf8 = new TextEncoder().encode('\u{1f9ed}CodeZine');
const data = new Uint8Array(k);
const d = [4, utf8.length, ...utf8]; // 8 bit byte mode
data.set(d.map((c, i) => c << 4 | (d[i + 1] ?? 0) >> 4));
for (let i = d.length; i < data.length; i++)
    data[i] = (i - d.length) % 2 ? 0x11 : 0xec;
const rscode = encodeRS(data, n - k);
// finder patterns
const finder = ['11111110', '10000010', '10111010', '10111010',
                '10111010', '10000010', '11111110', '00000000'];
for (let i = 0; i < 8; i++) {
    qr[i].set(finder[i]);
    qr[i].set(finder[i].split('').reverse(), size - 8);
    qr[size - 1 - i].set(finder[i]);
}
// timing patterns
for (let i = 8; i < size - 8; i++)
    qr[i][6] = qr[6][i] = 1 - i % 2;
// format information
let h = size - 1, v = 0;
for (let i = 0; i < 15; i++) {
    qr[v][8] = qr[8][h] = format >> i & 1;
    h -= i === 7 ? size - 15 : i === 8 ? 2 : 1;
    v += i === 5 ? 2 : i === 7 ? size - 15 : 1;
}
qr[size - 8][8] = 1;
// data and error corrction codewords
const mask = (i, j) => i % 2 === 0 ? 1 : 0;
const bit = (function* (cword) {
    for (let w of cword)
        for (let i = 7; i >= 0; i--)
            yield w >> i & 1;
})(rscode);
let a = -1, x = size - 1, y = size - 1;
while (x > 0) {
    for (let i = x; i > x - 2; i--)
        if (qr[y][i] === 2) qr[y][i] = bit.next().value ^ mask(y, i);
    y += a;
    if (y < 0 || y > size - 1) {
        a = -a; x -= x === 8 ? 3 : 2; y += a;
    }
}
const cell = ['\u0020\u0020', '\u2588\u2588'];
console.log(qr.map(r => r.reduce((a, d) => a + cell[d], '\t')).join('\n'));