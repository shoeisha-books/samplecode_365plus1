import java.time.LocalDate;
import java.time.MonthDay;
import java.time.temporal.ChronoUnit;
import java.util.Scanner;
import java.time.format.DateTimeParseException;

public class anniversarycountdown {
    public static void main(String[] args) {
        System.out.println("--- 記念日カウントダウンメーカー ---");
        try (Scanner sc = new Scanner(System.in)) {
            System.out.print("記念日の月を入力 (例: 12): ");
            int month = sc.nextInt();
            System.out.print("記念日の日を入力 (例: 25): ");
            int day = sc.nextInt();
            LocalDate today = LocalDate.now();
            MonthDay anniversaryMD = MonthDay.of(month, day);
            LocalDate nextAnniversary;
           if (anniversaryMD.isBefore(MonthDay.from(today)) || anniversaryMD.equals(MonthDay.from(today))) {
                nextAnniversary = anniversaryMD.atYear(today.getYear() + 1);
            } else {
                nextAnniversary = anniversaryMD.atYear(today.getYear());
            }
            long daysRemaining = ChronoUnit.DAYS.between(today, nextAnniversary);
            String message = (daysRemaining == 0) ? "おめでとう！今日はその記念日です！" :
                             String.format("次の記念日 (%s) まで、残り %d 日です！", nextAnniversary, daysRemaining);
            System.out.println("\n" + message);
        } catch (DateTimeParseException | java.util.InputMismatchException e) {
            System.out.println("エラー: 不正な入力または日付です。");
        }
    }
}