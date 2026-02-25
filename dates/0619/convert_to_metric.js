/**
 * ヤードポンド法からメートル法へ変換する関数
 * @param {number} length - 変換する長さ
 * @param {string} unit - 単位 ('ft', 'in', 'yd', 'mi')
 * @returns {object} - メートルとセンチメートルでの値
 */
function convertToMetric(length, unit) {
  const conversions = {
    'in': 0.0254,    // 1インチ = 0.0254メートル
    'ft': 0.3048,    // 1フィート = 0.3048メートル
    'yd': 0.9144,    // 1ヤード = 0.9144メートル
    'mi': 1609.34    // 1マイル = 1609.34メートル
  };

  if (!conversions[unit]) {
    console.error('無効な単位です。対応単位: in, ft, yd, mi');
    return null;
  }

  const meters = length * conversions[unit];
  const centimeters = meters * 100;

  return {
    meters: Math.round(meters * 100) / 100,
    centimeters: Math.round(centimeters * 100) / 100
  };
}

// 使用例
const result1 = convertToMetric(7, 'ft');
console.log(`7フィートは、約 ${result1.meters}メートル、${result1.centimeters}センチメートルです。`);

const result2 = convertToMetric(40, 'yd');
console.log(`40ヤードは、約 ${result2.meters}メートルです。`);