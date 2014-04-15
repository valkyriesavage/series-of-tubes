// Example by Tom Igoe

import processing.serial.*;

Serial myPort;  // The serial port
PFont f;

void setup() {
  size(500,500);
  // List all the available serial ports
  //println(Serial.list());
  // Open the port you are using at the rate you want:
  myPort = new Serial(this, Serial.list()[0], 9600);
  f = createFont("Arial",64,true); // Arial, 16 point, anti-aliasing on
}

void draw() {
  background(0);
  String txt = "no connection :(";
  while (myPort.available() > 0) {
    int inByte = myPort.read();
    switch(inByte) {
      case 0:
          txt = "All in!";
          break;
      case 1:
          txt = "Pen out";
          break;
      case 2:
          txt = "Marker out";
          break;
      case 3:
          txt = "Pencil out";
          break;
      case 4:
          txt = "Brush out";
          break;
    }
  }
  fill(255);
  textFont(f);
  text(txt,10,height/2);
}
