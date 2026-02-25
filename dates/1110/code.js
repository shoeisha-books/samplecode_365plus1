let girlfriends = [
    { name: "カンナ", email: "kanna@example.com", relationship: 91 },
    { name: "スズ", email: "suzu@example.com", relationship: 89 },
    { name: "ハルナ", email: "haruna@example.com", relationship: 78 },
    { name: "ミナミ", email: "minami@example.com", relationship: 92 },
];

function dailyTask(gf) {
    const messages = [
        ["おはようございます！", "おはよ！"],
        ["今日はお疲れ様でした！", "お疲れ様！"],
        ["そろそろ遊びに行きたいです！", "遊び行こ！"],
    ];
    const index = Math.floor(Math.random() * messages.length);
    const message = messages[index][gf.relationship >= 90 ? 1 : 0];
    const mailto = `mailto:${gf.email}?body=${encodeURIComponent(message)}`;
    console.log(`Name: ${gf.name}, Message: ${message}`);
    console.log(`${mailto}\n`);
}

function main() {
    girlfriends.forEach(dailyTask);
}

main();
