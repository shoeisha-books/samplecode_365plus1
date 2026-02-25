/**
 * 指定した条件に基づいてランダムなパスワードを生成します。
 * @param {number} length 生成するパスワードの長さ (必須)
 * @param {boolean} includeNumbers 数字を含めるか (任意, デフォルト: true)
 * @param {boolean} includeLowercase 小文字アルファベットを含めるか (任意, デフォルト: true)
 * @param {boolean} includeUppercase 大文字アルファベットを含めるか (任意, デフォルト: true)
 * @param {boolean} includeSymbols 特殊文字を含めるか (任意, デフォルト: true)
 * @returns {string} 生成されたランダムなパスワード
 */
function generatePassword(length, includeNumbers = true, includeLowercase = true, includeUppercase = true, includeSymbols = true) {
  const numbers = '0123456789';
  const lowercase = 'abcdefghijklmnopqrstuvwxyz';
  const uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const symbols = '!@#$%^&*()_+~`|}{[]:;?><,./-=';

  let allChars = '';
  if (includeNumbers) allChars += numbers;
  if (includeLowercase) allChars += lowercase;
  if (includeUppercase) allChars += uppercase;
  if (includeSymbols) allChars += symbols;
  if (allChars.length === 0) {
    throw new Error('パスワードに含める文字の種類が一つも選択されていません。');
  }

  let password = '';
  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * allChars.length);
    password += allChars[randomIndex];
  }

  return password;
}

// 使用例
// 12文字で、数字、アルファベット、特殊文字をすべて含むパスワードを生成
console.log('数字、アルファベット、特殊文字をすべて含むパスワード:', generatePassword(12));

// 10文字で、数字とアルファベットのみを含むパスワードを生成
console.log('数字とアルファベットのみ:', generatePassword(10, true, true, true, false));