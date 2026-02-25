# 誕生日を祝うモジュールを定義
module HappyBirthday
  def self.included(base)
    # 現在の日付を取得
    current_date = Time.now
    month = current_date.month
    day = current_date.day

    if month == 2 && day == 24
      # 誕生日であれば、お祝いのメッセージを出力するメソッドを定義
      base.define_method(:birthday_message) do
        puts "Happy Birthday, Ruby!"
        puts "Rubyは今日で#{current_date.year - 1993}歳です！"
      end
    else
      # 誕生日でなければ、別の日であることを伝えるメソッドを定義
      base.define_method(:birthday_message) do
        puts "今日はRubyの誕生日ではありません。次の2月24日を楽しみに待ちましょう！"
      end
    end
  end
end

# 新しいクラスを定義し、`HappyBirthday`モジュールをインクルード
class Celebration
  include HappyBirthday
end

# クラスのインスタンスを生成
c = Celebration.new
# 動的に定義されたメソッドを呼び出す
c.birthday_message