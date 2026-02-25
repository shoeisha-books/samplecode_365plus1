function printChessboardWithPieces() {
  // チェスボードの初期状態を2次元配列で定義
  const board = [
    ['r', 'n', 'b', 'q', 'k', 'b', 'n', 'r'],
    ['p', 'p', 'p', 'p', 'p', 'p', 'p', 'p'],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '],
    ['P', 'P', 'P', 'P', 'P', 'P', 'P', 'P'],
    ['R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R']
  ];

  // ヘッダーとして列のインデックス（a～h）を表示
  console.log('    A   B   C   D   E   F   G   H');

  // 盤面の各行と列をループ
  for (let i = 0; i < board.length; i++) {
    let rowStr = `${8 - i} |`;
    for (let j = 0; j < board[i].length; j++) {
      rowStr += ` ${board[i][j]} |`;
    }
    console.log(rowStr);
  }
}

// 関数を呼び出して盤面を表示
printChessboardWithPieces();
// 7月20日は世界チェスデー