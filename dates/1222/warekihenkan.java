import java.time.LocalDate;
import java.time.chrono.JapaneseDate;
import java.time.format.DateTimeFormatter;
import java.util.Locale;
import java.util.Scanner;

public class warekihenkan {
    public static void main(String[] args) {
        System.out.println("--- 西暦→和暦 変換機 ---");
        try (Scanner sc = new Scanner(System.in)) {
            System.out.print("西暦年を入力 (例: 2024): ");
            int year = sc.nextInt();
            System.out.print("月を入力 (例: 5): ");
            int month = sc.nextInt();
            System.out.print("日を入力 (例: 1): ");
            int day = sc.nextInt();
            LocalDate ld = LocalDate.of(year, month, day);
            JapaneseDate jd = JapaneseDate.from(ld);
            
            DateTimeFormatter formatter = 
                DateTimeFormatter.ofPattern("Gyy年M月d日", Locale.JAPAN);
                
            System.out.println("\n変換結果:");
            System.out.println(jd.format(formatter));
            
        } catch (Exception e) {
            System.out.println("入力または日付が不正です。");
        }
    }
}