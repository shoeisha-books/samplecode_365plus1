// キャラクタークラスの定義
class Character {
    name = "";
    hp = 100;

    constructor(name) {
        this.name = name;
    }

    function attack(target) {
        print(this.name + "は" + target.name + "を攻撃した！");
        target.hp -= 10;
        print(target.name + "の体力は" + target.hp + "になった。");
    }

    function isAlive() {
        return hp > 0;
    }
}

// インスタンスの生成
local hero = Character("勇者");
local monster = Character("スライム");

// メソッドの呼び出し
hero.attack(monster);

if (monster.isAlive()) {
    print("スライムはまだ生きている。");
} else {
    print("スライムを倒した！");
}
