boolean gameStart = false;

final int Color = 128;
final int diam = 20;

int rectHeight = 150;
int rectWidth = 10;

PImage P;

float x = 150;
float y = 150;
float speedX = random(3, 5);
float speedY = random(3, 5);
int score = 0;
float r = random(800);
float p = random(50);

void setup() {
  size(1400, 800);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  fill(0,255,255);
  P = loadImage("background.png");
  P.resize(1400, 800);
}

void draw() { 
  background(P);
  fill(Color);
  stroke(128);

  if (gameStart) {
    x = x + speedX;
    y = y + speedY;
    arc(x, y, diam, diam, 0, PI * 2);

    drawInfo();
    drawObstacles();
    collision();
    BouncyTopAndBottomWalls();
    BouncySides();
    arc(1300, 100, 80, 80, 0, PI+QUARTER_PI, PIE);
      if ( frameCount % 60 == 0 ){
    ++score;
  }
  } else {
    textSize(32);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Click to start playing!", 700, 400);
  }
}
void mousePressed() {
  gameStart = !gameStart;
}

void drawInfo() {
  textAlign(CENTER, CENTER);
  fill(255,0,100);
  textSize(25);
  text("PING", 40 , 15);
  textSize(20);
  text("by Nick Zegels", 45, 40);
  text("score: " + score, 1300, 40); 
}

void drawObstacles(){
  fill(Color);
  rect(0, y - 75, rectWidth, rectHeight);
  rect(250, 125, rectWidth, rectHeight);
  rect(550, 455, rectWidth, rectHeight);
  rect(1200, 700, rectWidth, rectHeight);
  rect(1100, 100, rectWidth, rectHeight);
  fill(Color);
  rect(width - rectWidth, mouseY-rectHeight/2, rectWidth, rectHeight); 
  

}
void collision(){
  
  if( x > 550 &&  x < 560 && y > 455 && y < 615) {
    if(speedX < 5) {
      speedX = speedX * -1;
      x = x + speedX;
      rectHeight = constrain(rectHeight, rectWidth, rectHeight); 
    } else {
      speedX = speedX * -1;
      rectHeight = constrain(rectHeight, rectWidth, rectHeight);
    } 
  }
  
  
  if( x > 250 && x < 260 && y > 125 && y < 285){
      if(speedX < 5){
      speedX = speedX * -1;
      x = x + speedX;
      rectHeight = constrain(rectHeight, rectWidth, rectHeight); 
      } else {
      speedX = speedX * -1;
      rectHeight = constrain(rectHeight, rectWidth, rectHeight);
      }
  }
  
  if( x > 1200 && x < 1210 && y > 700 && y < 860){
    if(speedX < 5){
    speedX = speedX * -1;
    x = x + speedX;
    rectHeight = constrain(rectHeight, rectWidth, rectHeight); 
    } else {
    speedX = speedX * -1;
    rectHeight = constrain(rectHeight, rectWidth, rectHeight);
    }
  }
  
   if( x > 1100 && x < 1110 && y > 100 && y < 260){
      if(speedX < 5){
      speedX = speedX * -1;
      x = x + speedX;
      rectHeight = constrain(rectHeight, rectWidth, rectHeight); 
      } else {
      speedX = speedX * -1;
      rectHeight = constrain(rectHeight, rectWidth, rectHeight);
      }
  }
}

void BouncyTopAndBottomWalls(){
      if (x > width) { 
      gameStart = false;
      x = r;
      y = r; 
      speedX = random(3, 5);
      speedY = random(3, 5);
  }  
  
  if ( y > height || y < 0 ) {
    speedY = speedY * -1;
    y = y + speedY;
  }
}

void BouncySides(){
     if ( x > width - 10 && y > mouseY - rectHeight/2 && y < mouseY + rectHeight/2 ) {
      speedX = speedX * -1;
      x = x + speedX;
      ellipse(x,y,diam,diam);
      rectHeight = constrain(rectHeight, rectWidth, rectHeight);
    }  
    
    else if (x < 10) {
      speedX = speedX * -1.1;
      x = x + speedX;
   }
} 
