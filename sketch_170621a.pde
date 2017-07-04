/*PFont font;
String time = "10:10";
int t;
int t2;
int interval = 10;
int interval2 = 2;

void setup()
{
  size(300, 300);
  font = createFont("Arial", 30);
  background(255);
  fill(0);
}

void draw()
{
    background(255);
   
    t = interval-int(millis()/1000);
    time = nf(t , 4);
    //t2 = interval2-int(millis()/1000);
    
    if(t == 0){
      println("GAME OVER");
    interval+=10;}

   text(time, width/2, height/2);
}*/

// =================================================================Buttuns

int rectX, rectY;      // Position of square button
int circleX, circleY;  // Position of circle button
int rectSize = 20;     // Diameter of rect
int circleSize = 20;   // Diameter of circle
color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

// =================================================================Watch
StopWatchTimer sw;
// Main functions
int sec;
int min;
int interval = 00;
int intervalForMin = 10;
int secundTime = 59;

void setup() {
  size(400, 400);
  println (millis());
  sw = new StopWatchTimer();
  sw.start();
//====================================================================Button
  
  rectColor = color(50);
  rectHighlight = color(100);
  circleColor = color(255);
  circleHighlight = color(50);
  baseColor = color(102);
  currentColor = baseColor;
  circleX = CENTER+270;
  circleY = height-225;
  rectX = CENTER+100;
  rectY = height-235;
  ellipseMode(CENTER);
  
//==================================================================== watch
}
void draw () {
  time();
//====================================================================button

//Buttun function 
update(mouseX, mouseY);
  //background(currentColor);
  
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
  }
  if (rectOver) {
    currentColor = rectColor;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }

//===================================================================watch
  
}

// Other functions Timer
void time() {
  background(#FFFFFF);
  fill(#000000);
  textAlign(CENTER);
   sec = interval-int(millis()/1000);
   min = intervalForMin;
   text("Blue: "+nf(0,2)+"  "+nf(min, 2)+":"+nf(sec, 2)+"  Blue: "+nf(0,2), 195, 175);
   if(sec == 0){
     
     intervalForMin = min - 1;
     interval+=secundTime;
     
 
   }
}

// classes
class StopWatchTimer {
  int startTime = 0, stopTime = 0;
  boolean running = false; 
  void start() {
    startTime = millis();
    running = true;
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    }
    else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
}