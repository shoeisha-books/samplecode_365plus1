/**
 * 指定された時間で息を吸う、止める、吐くメッセージを出力する呼吸法タイマー
 * @param {number} inhaleTime - 息を吸う時間（秒）
 * @param {number} holdTime - 息を止める時間（秒）
 * @param {number} exhaleTime - 息を吐く時間（秒）
 */
async function breathingTimer(inhaleTime, holdTime, exhaleTime) {
  console.log("呼吸法タイマーを開始します");

  // 息を吸う
  console.log(`息を吸って... (${inhaleTime}秒)`);
  await new Promise(resolve => setTimeout(resolve, inhaleTime * 1000));

  // 息を止める
  console.log(`息を止めて... (${holdTime}秒)`);
  await new Promise(resolve => setTimeout(resolve, holdTime * 1000));

  // 息を吐く
  console.log(`息を吐いて... (${exhaleTime}秒)`);
  await new Promise(resolve => setTimeout(resolve, exhaleTime * 1000));

  console.log("\n呼吸法が完了しました");
}

// 使用例：4秒吸って、4秒止めて、6秒吐く
breathingTimer(4, 4, 6);
// 6月20日はヨガの国際デー