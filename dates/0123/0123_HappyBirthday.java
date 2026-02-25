import java.time.LocalDate;
import java.time.Month;

public class JavaBirthday {
    //Javaの誕生日を表す定数です。
    private static final int BIRTHDAY_YEAR = 1996;
    private static final Month BIRTHDAY_MONTH = Month.JANUARY;
    private static final int BIRTHDAY_DAY = 23;

    public static void main(String[] args) {
        JavaBirthday birthday = new JavaBirthday();
        birthday.celebrate();
    }

    public void celebrate() {
        // 現在の日付を取得
        LocalDate today = LocalDate.now();
        LocalDate javaReleaseDate = LocalDate.of(BIRTHDAY_YEAR, BIRTHDAY_MONTH, BIRTHDAY_DAY);

        // 今日の日付がJavaの誕生日と一致するか確認
        if (isJavaBirthday(today)) {
            long age = ChronoUnit.YEARS.between(javaReleaseDate, today);
            System.out.println("Happy Birthday, Java!");
            System.out.println("Javaは、1996年1月23日に最初の商用バージョンがリリースされました。");
            System.out.println("Javaは今年で" + age + "歳になります！");
        } else {
            System.out.println("今日はJavaの誕生日ではありません。");
            System.out.println("次の1月23日を楽しみに待ちましょう！");
        }
    }

    private boolean isJavaBirthday(LocalDate date) {
        return date.getMonth() == BIRTHDAY_MONTH && date.getDayOfMonth() == BIRTHDAY_DAY;
    }
}