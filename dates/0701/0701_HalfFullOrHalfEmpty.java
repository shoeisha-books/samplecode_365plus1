import java.util.Random;

public class HalfFullOrHalfEmpty {

    public static void main(String[] args) {

        // 定数として楽観的な見方と悲観的な見方を定義
        final String optimistic_view = "まだ半分ある";
        final String pessimistic_view = "もう半分しかない";

        // 出力する文字列を保持するための変数を宣言
        String output_text;

        // Randomクラスのインスタンスを作成し、0または1をランダムに生成
        Random rand = new Random();
        int choice = rand.nextInt(2);

        // 生成された数値に基づいてoutput_textに文字列を代入
        if (choice == 0) {
            output_text = optimistic_view;
        } else {
            output_text = pessimistic_view;
        }

        System.out.println("今年は" + output_text);
    }
}