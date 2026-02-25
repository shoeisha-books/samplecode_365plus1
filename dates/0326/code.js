// ネストされたループの一括終了。

let sum = 0;

outerLoop: // 外側の for に outerLoop という名前を付ける。
for (let i = 0; i < 10; i++) {
    for (let j = 0; j < 10; j++) {
        console.log("i: " + i);
        console.log("j: " + j);
        
        sum += i * j;
        console.log("sum: " + sum);
        console.log("---");
        
        if (sum > 10) {
            console.log("outerLoopを終わらせる。");
            break outerLoop;
        }
    }
}

console.log("result: " + sum);
