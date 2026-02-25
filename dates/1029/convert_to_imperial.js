/**
 * メートル法からヤードポンド法へ変換する関数
 * @param {number} length - 変換する長さ
 * @param {string} unit - 単位 ('m', 'cm', 'km')
 * @returns {object} - フィートとインチでの値
 */
function convertToImperial(length, unit) {
  const conversions = {
    'm': 3.28084,    // 1メートル = 3.28084フィート
    'cm': 0.0328084, // 1センチメートル = 0.0328084フィート
    'km': 3280.84    // 1キロメートル = 3280.84フィート
  };

  if (!conversions[unit]) {
    console.error('無効な単位です。対応単位: m, cm, km');
    return null;
  }

  const totalFeet = length * conversions[unit];
  const feet = Math.floor(totalFeet);
  const inches = Math.round((totalFeet - feet) * 12 * 10) / 10;

  return {
    feet: feet,
    inches: inches
  };
}

// 使用例
const result1 = convertToImperial(1, 'm');
console.log(`1メートルは、約 ${result1.feet}フィート、${result1.inches}インチです。`);

const result2 = convertToImperial(2, 'km');
console.log(`2キロメートルは、約 ${Math.round(result2.feet)}フィートです。`);