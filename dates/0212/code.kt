fun weekday(year: Int, month: Int, day: Int): String {
    var y = year
    var m = month
    if (m < 3) {              // Jan, Feb を 13,14 月として前年扱い
        m += 12
        y -= 1
    }
    val k = y % 100           // 年の下 2 桁
    val j = y / 100           // 世紀
    val h = (day + 13 * (m + 1) / 5 + k + k / 4 + j / 4 + 5 * j) % 7
    return listOf("土曜日", "日曜日", "月曜日", "火曜日", "水曜日", "木曜日", "金曜日")[h]
}

fun main() {
    // 標準入力: yyyy mm dd
    val parts = readLine()!!.trim().split(Regex("\\s+")).map { it.toInt() }
    val (y, m, d) = parts
    println(weekday(y, m, d))
}