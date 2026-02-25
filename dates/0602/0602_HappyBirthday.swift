import Foundation

struct Birthday {
    let month: Int
    let day: Int
}

// Swiftの誕生日を定義
let swiftBirthday = Birthday(month: 6, day: 2)

// 今日の日付を取得 (オプショナル型)
let today: Date? = Date()

if let unwrappedToday = today {
    let calendar = Calendar.current
    let components = calendar.dateComponents([.month, .day], from: unwrappedToday)
    let currentMonth = components.month
    let currentDay = components.day

    let celebrate = {
        print("Happy Birthday, Swift!")
        print("6月2日はSwiftの誕生日です。")
    }

    // 今日の日付がSwiftの誕生日と一致するか確認
    if let month = currentMonth, let day = currentDay, month == swiftBirthday.month && day == swiftBirthday.day {
        celebrate()
    } else {
        print("今日はSwiftの誕生日ではありません。")
        print("次の6月2日を楽しみに待ちましょう！")
    }
} else {
    print("日付が取得できませんでした。")
}