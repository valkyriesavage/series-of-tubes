//Code for the QRE1113 Digital board
//Outputs via the serial terminal - Lower numbers mean more reflected
//3000 or more means nothing was reflected.

int MARKER = 2;
int PEN = 3;
int PENCIL = 4;
int PAINTBRUSH = 5;

int THRESH[] = {-1, -1, 300, 200, 159, 110};

const int averageOver = 10;
int lastSeveral[4][averageOver] = {
                    {0,0,0,0,0,0,0,0,0,0},
                    {0,0,0,0,0,0,0,0,0,0},
                    {0,0,0,0,0,0,0,0,0,0},
                    {0,0,0,0,0,0,0,0,0,0}
                  };

boolean dbg = false;

void setup(){
  Serial.begin(9600); 
}


void loop(){

  boolean mOut = absent(MARKER);
  boolean pOut = absent(PEN);
  boolean cOut = absent(PENCIL);
  boolean bOut = absent(PAINTBRUSH);
  
  if(pOut) {
    //Serial.println("Pen is out!");
    Serial.write(1);
  }
  if(mOut) {
    //Serial.println("Marker is out!");
    Serial.write(2);
  }
  if(cOut) {
    //Serial.println("Pencil is out!");
    Serial.write(3);
  }
  if(bOut) {
    //Serial.println("Paintbrush is out!");
    Serial.write(4);
  }
  
  if(!mOut && !pOut && !cOut && !bOut) {
    //Serial.println("A place for every thing, and every thing in its place.\n"); 
    Serial.write(0);
  }
  
  /*
    int pen = readQD(PEN);
    int marker = readQD(MARKER);
    int brush = readQD(PAINTBRUSH);
    int pencil = readQD(PENCIL);
    Serial.print("pen: ");
    Serial.print(pen);
    Serial.print("\tmarker: ");
    Serial.print(marker);
    Serial.print("\tbrush: ");
    Serial.print(brush);
    Serial.print("\tpencil: ");
    Serial.println(pencil);
  */
}

void shiftArr(int pin) {
  for(int i = 0; i < averageOver-1; i++) {
     lastSeveral[pin][i] = lastSeveral[pin][i+1];
  }
}

double average(int pin, int reading) {
  lastSeveral[pin][averageOver-1] = reading;
  reading = 0;
  for(int i = 0; i < averageOver; i++) {
     reading += lastSeveral[pin][i];
  }
  return reading / averageOver;
}

boolean absent(int pin) {
  int reading = readQD(pin);
  shiftArr(pin);
  reading = average(pin, reading);
  return reading > THRESH[pin]; 
}


int readQD(int pin){
  //Returns value from the QRE1113 
  //Lower numbers mean more refleacive
  //More than 3000 means nothing was reflected.
  pinMode( pin, OUTPUT );
  digitalWrite( pin, HIGH );  
  delayMicroseconds(10);
  pinMode( pin, INPUT );

  long time = micros();

  //time how long the input is HIGH, but quit after 3ms as nothing happens after that
  while (digitalRead(pin) == HIGH && micros() - time < 3000); 
  int diff = micros() - time;

  return diff;
}
