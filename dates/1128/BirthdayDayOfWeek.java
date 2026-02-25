import java.time.*;
import java.time.format.TextStyle;
import java.util.*;

public class BirthdayDayOfWeek {
    public static void main(String[] args) {
        try (Scanner sc = new Scanner(System.in)) { 

            System.out.print("生まれた西暦を入力: ");
            int year = sc.nextInt();

            System.out.print("生まれた月を入力: ");
            int month = sc.nextInt();

            System.out.print("生まれた日を入力: ");
            int day = sc.nextInt();

            try {
                LocalDate date = LocalDate.of(year, month, day);
                DayOfWeek dow = date.getDayOfWeek();
                
                String dayOfWeekName = dow.getDisplayName(TextStyle.FULL, Locale.JAPANESE);
                
                System.out.println("その曜日は: " + dayOfWeekName);
            } catch (DateTimeException e) {
                System.out.println("不正な日付です。");
            }
        }
    }
}