// うめぼしを作るミニ工程シミュレーション
let ume = ["生梅", "塩漬け", "天日干し", "完成うめぼし"];
ume.forEach((step, i) => {
  setTimeout(() => {
    console.log(`工程${i+1}: ${step}中…`);
    if (step === "完成うめぼし"){
        console.log("🌞 しょっぱくておいしい梅干しが完成！");
    }
  }, i * 600);
});