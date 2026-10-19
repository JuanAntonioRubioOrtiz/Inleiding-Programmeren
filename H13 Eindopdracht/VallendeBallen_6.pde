Ball ball1;

void setup(){
  size(400, 400);
  ball1 = new Ball(200, 0);
}

void draw(){
  ball1.display();
  ball1.move();
  ball1.resetUitBeeld();
  ball1.raaktPaddel();
  rect(mouseX - 25, 350, 50, 10);
  }
  
class Ball{
  int BallX;
  int BallY;
  int Diameter;
  int snelheid;
  int score = 0;

  Ball(int ballx, int bally){
    BallX = ballx;
    BallY = bally;
    Diameter = int(random(10,60));
    snelheid = int(random(2,8));
  }

  void display(){
    background(255);
    circle(BallX, BallY, Diameter);
    textSize(20);
    fill(0);
    text("score: " + score, 10,20);
  }
 void move(){
  BallY += snelheid;
 }
 void resetUitBeeld(){
   if (BallY >= 400 + Diameter) {
    BallY = 0;
    BallX = int(random(width));
    
    Diameter = int(random(10,60));
    snelheid = int(random(2,8));
  }
 }
 void raaktPaddel(){
   if (BallY + Diameter/2 >= 350 &&
     BallX >= mouseX - 25 &&
     BallX <= mouseX + 25) {
      BallY = 0;
      BallX = int(random(width));
      Diameter = int(random(10,60));
      snelheid = int(random(2,8));
      score++;
    }
 }
}
