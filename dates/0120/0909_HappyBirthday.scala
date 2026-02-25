import java.time.LocalDate
import java.time.temporal.ChronoUnit

object ScalaBirthdayCountdown {

  // 高階関数: 誕生日を祝うメッセージを作成する
  def createMessage(isBirthday: Boolean, daysToNextBirthday: Long): String = {
    isBirthday match {
      case true => "Happy Birthday, Scala!"
      case false => s"Scalaの誕生日9月9日まであと${daysToNextBirthday}"
    }
  }

  def main(args: Array[String]): Unit = {
    val today = LocalDate.now()
    
    // 次の9月9日を計算
    val nextBirthday = {
      val thisYearBirthday = LocalDate.of(today.getYear, 9, 9)
      if (today.isAfter(thisYearBirthday)) {
        LocalDate.of(today.getYear + 1, 9, 9)
      } else {
        thisYearBirthday
      }
    }

    val isTodayScalaBirthday = today.isEqual(nextBirthday)
    val daysToNextBirthday = ChronoUnit.DAYS.between(today, nextBirthday)

    val message = createMessage(isTodayScalaBirthday, daysToNextBirthday)
    println(message)
  }
}