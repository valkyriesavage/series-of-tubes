Graph MyArduinoGraph = new Graph(150, 80, 500, 300, color (200, 20, 20));

int states = 4;

float[][] gesturePoints = new float[states][2];
float[] gestureDist = new float[states];
String[] names = {"Not Present", 
                  //"Brain", "Olfactory Bulb", "Motor Cortex",
                  "Boat", "Port Side", "Stern"};
                  

int recentClosestCount = 50;
int[] recentClosest = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};

void setup() {

  size(1200, 1200); 

  MyArduinoGraph.xLabel="Readnumber";
  MyArduinoGraph.yLabel="Amp";
  MyArduinoGraph.Title=" Graph";  
  noLoop();
  PortSelected=0;      /* ====================================================================
   adjust this (0,1,2...) until the correct port is selected 
   In my case 2 for COM4, after I look at the Serial.list() string 
   println( Serial.list() );
   [0] "COM1"  
   [1] "COM2" 
   [2] "COM4"
   ==================================================================== */
  SerialPortSetup();      // speed of 115200 bps etc.
  println("setup complete");
  
  delay(500);
}


void slideMaxes(int newReading) {
   for(int i=0; i < recentClosestCount; i++) {
     if(i < recentClosestCount-1) {
      recentClosest[i] = recentClosest[i+1];
     } else {
      recentClosest[i] = newReading;
     } 
   }
}

boolean consistent() {
  int testAgainst = recentClosest[0];
  for (int i=0; i < recentClosestCount; i++) {
    println("" + i + ": " + recentClosest[i] + "or " + testAgainst);
     if(recentClosest[i] != testAgainst) {
      return false;
     }
   }
   return true;
}

void draw() {

  background(255);

  /* ====================================================================
   Print the graph
   ====================================================================  */

  if ( DataRecieved3 ) {
    pushMatrix();
    pushStyle();
    MyArduinoGraph.yMax=1000;      
    MyArduinoGraph.yMin=-200;      
    MyArduinoGraph.xMax=int (max(Time3));
    MyArduinoGraph.DrawAxis();    
    MyArduinoGraph.smoothLine(Time3, Voltage3);
    popStyle();
    popMatrix();

    /* ====================================================================
     Gesture compare
     ====================================================================  */
    float totalDist = 0;
    int currentMax = 0;
    float currentMaxValue = -1;
    for (int i = 0; i < states;i++)

    {

      //  gesturePoints[i][0] = 
      if (mousePressed && mouseX > 750 && mouseX<800 && mouseY > 100*(i+1) && mouseY < 100*(i+1) + 50)
      {
        fill(255, 0, 0);

        gesturePoints[i][0] = Time3[MyArduinoGraph.maxI];
        gesturePoints[i][1] = Voltage3[MyArduinoGraph.maxI];
      }
      else
      {
        fill(255, 255, 255);
      }

   //calucalte individual dist
      gestureDist[i] = dist(Time3[MyArduinoGraph.maxI], Voltage3[MyArduinoGraph.maxI], gesturePoints[i][0], gesturePoints[i][1]);
      totalDist = totalDist + gestureDist[i];
      if(gestureDist[i] < currentMaxValue || i == 0)
      {
         currentMax = i;
         currentMaxValue =  gestureDist[i];
      }
    }
    
    slideMaxes(currentMax);
    totalDist=totalDist /3;

    for (int i = 0; i < states;i++)
    {
      
      if(currentMax == i && consistent())
       {
         /*float currentAmmount = 0;
         currentAmmount = 1-gestureDist[i]/totalDist;*/
         fill(255, 0, 0);
       }
       else
       {
         fill(255,255,255);
       }

      stroke(0, 0, 0);
      rect(750, 100 * (i+1), 50, 50);
      fill(0,0,0);
      textSize(30);
      text(names[i],810,100 * (i+1)+25);

      fill(255, 0, 0);
    }


  }
}

void stop()
{

  myPort.stop();
  super.stop();
}

