const int ctrlPin=8;
const int LED=13;

const int actuate_time = 50;
const int refresh_time = 3000;

void setup() {
  pinMode(ctrlPin, OUTPUT);
  pinMode(LED, OUTPUT);
}

void loop() {
  digitalWrite(LED, HIGH);
  digitalWrite(ctrlPin, LOW);
  
  delay(actuate_time);
  digitalWrite(LED, LOW);
  digitalWrite(ctrlPin, HIGH);
  
  delay(refresh_time);
}
