int BallX = 200;
int BallY = 0;
int Diameter = 50;
int snelheid = 3;
int score = 0;

void setup(){
  size(400, 400);
}

void draw(){
  background(255);
    textSize(20);
    fill(0);
    text("score: " + score, 10,20);
  circle(BallX, BallY, Diameter);
  BallY = BallY + snelheid;
  if (BallY >= 400 + Diameter) {
    BallY = 0;
    BallX = int(random(width));   
  }
  rect(mouseX - 25, 350, 50, 10);
  if(BallY + Diameter/2 >= 350 && BallY + Diameter/2 >= 360 
    && BallX + Diameter >= mouseX && BallX - Diameter <= mouseX){
    BallY = 0;
    BallX = int(random(width));
    score++;
  }
}
