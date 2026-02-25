// 経過日数と節約金額を計算し、表示を更新するメインの関数
function update() {
    const inputs = getInputs();
    if (!inputs) return;

    const { startDate, cigarettesPerDay, packPrice } = inputs;
    const now = new Date();
    
    // 経過時間をミリ秒で計算
    const timeDifference = now - startDate;
    
    // 日数に変換
    const days = Math.floor(timeDifference / (1000 * 60 * 60 * 24));
    
    // 1日あたりのタバコ代を計算
    const pricePerDay = (cigarettesPerDay / 20) * packPrice;
    
    // 節約金額を計算（経過日数 * 1日あたりのタバコ代）
    const moneySaved = days * pricePerDay;
    
    // HTML要素に結果を表示
    document.getElementById('timeElapsed').textContent = `${days}日`;
    document.getElementById('moneySaved').textContent = moneySaved.toFixed(2);
}

