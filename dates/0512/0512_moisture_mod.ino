const int moisturePin = A0;
const int ledPin = 13;

// 水やりが必要かどうかを判断するしきい値
// この値はセンサーや環境によって調整が必要です。
// センサーが乾燥しているほど値は高くなります。
const int threshold = 700; 

void setup() {
  Serial.begin(9600); 
  pinMode(ledPin, OUTPUT);
}

void loop() {
  int sensorValue = analogRead(moisturePin); 

  Serial.print("Sensor Value: ");
  Serial.println(sensorValue);

  if (sensorValue > threshold) {
    digitalWrite(ledPin, HIGH); 
    Serial.println("Warning: Water is needed!");
  } else {
    digitalWrite(ledPin, LOW);
    Serial.println("Soil is moist enough.");
  }

  delay(1000 * 3600); 
}