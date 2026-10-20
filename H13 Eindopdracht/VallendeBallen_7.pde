Ball[] ball;
Score score;

void setup(){
  size(400, 400);
  
  ball = new Ball[3];
  
  score = new Score();
  
  for(int i = 0; i < 3; i++){
    ball[i] = new Ball(int(random(width)), 0);
  }
}

void draw(){
    background(255);
    
  for(int i = 0; i < 3; i++){
  ball[i].display();
  ball[i].move();
  ball[i].resetUitBeeld();
  ball[i].raaktPaddel();
  }
  
  score.display();
  
  rect(mouseX - 25, 350, 50, 10);
  }
  
class Ball{
  int BallX;
  int BallY;
  int Diameter;
  int snelheid;

  Ball(int ballx, int bally){
    BallX = ballx;
    BallY = bally;
    Diameter = int(random(10,60));
    snelheid = int(random(2,5));
  }

  void display(){
    circle(BallX, BallY, Diameter);
  }
 void move(){
  BallY += snelheid;
 }
 void resetUitBeeld(){
   if (BallY >= 400 + Diameter) {
    BallY = 0;
    BallX = int(random(width));
    
    Diameter = int(random(10,60));
    snelheid = int(random(2,5));
  }
 }
 void raaktPaddel(){
   if (BallY + Diameter/2 >= 350 &&
     BallX >= mouseX - 25 &&
     BallX <= mouseX + 25) {
      BallY = 0;
      BallX = int(random(width));
      Diameter = int(random(10,60));
      snelheid = int(random(2,5));
      score.score++;
    }
 }
}

class Score{
  int score;
  
  Score(){
  score = 0;
  }

  void display(){
    textSize(20);
    fill(0);
    text("score: " + score, 10,20);
  }
}
