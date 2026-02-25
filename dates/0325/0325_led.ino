// LEDを接続したデジタルピンを定義
#define LED_PIN 13;

// プログラム開始時に一度だけ実行される初期設定
void setup() {
  // LEDピンを出力モードに設定
  pinMode(LED_PIN, OUTPUT);
}

// プログラムが繰り返し実行されるメインループ
void loop() {
  // LEDを点灯
  digitalWrite(LED_PIN, HIGH);
  // 1000ミリ秒（1秒）待機
  delay(1000);

  // LEDを消灯
  digitalWrite(LED_PIN, LOW);
  // 1000ミリ秒（1秒）待機
  delay(1000);
}
// 3月25日は電気記念日