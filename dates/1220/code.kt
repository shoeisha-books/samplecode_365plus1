import kotlinx.datetime.LocalDateTime
import kotlinx.datetime.Month
import kotlinx.datetime.TimeZone
import kotlinx.datetime.toLocalDateTime
import kotlin.io.encoding.Base64
import kotlin.time.Clock

fun main() {
    val now: LocalDateTime = Clock.System.now().toLocalDateTime(TimeZone.of("Asia/Tokyo"))
    val message = when (now.month) {
        Month.DECEMBER ->  "57+U5rOz56S+44Gv5LuK5pyI44GnNDDlkajlubQ="
        Month.NOVEMBER ->  "57+U5rOz56S+44Gv5p2l5pyI44GnNDDlkajlubQ="
        else -> "57+U5rOz56S+44GvMjAyNeW5tDEy5pyI44GrNDDlkajlubQ="
    }
    println(Base64.decode(message).decodeToString())
}