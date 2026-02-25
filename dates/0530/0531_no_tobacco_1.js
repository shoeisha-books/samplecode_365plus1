// 禁煙開始日、1日の喫煙本数、1箱の価格を取得する関数
function getInputs() {
    const startDateInput = document.getElementById('startDate').value;
    const cigarettesPerDay = parseFloat(document.getElementById('cigarettesPerDay').value);
    const packPrice = parseFloat(document.getElementById('packPrice').value);
    if (!startDateInput || isNaN(cigarettesPerDay) || isNaN(packPrice)) {
        alert('全ての項目を入力してください。');
        return null;
    }
    // 入力された日付をUTCで扱い、時刻を00:00:00に設定
    const startDate = new Date(startDateInput);
    const startUTC = Date.UTC(startDate.getFullYear(), startDate.getMonth(), startDate.getDate());
    return {
        startDate: new Date(startUTC),
        cigarettesPerDay: cigarettesPerDay,
        packPrice: packPrice
    };
}

// 計算開始ボタンがクリックされたときに呼び出される関数
let intervalId = null;

function startCounting() {
    // 既にタイマーが動いていたら停止
    if (intervalId) {
        clearInterval(intervalId);
    }
    // 1秒ごとにupdate関数を呼び出す
    intervalId = setInterval(update, 1000);
    update(); // 最初の1回目をすぐに実行
}
