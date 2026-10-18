int BallX = 200;
int BallY = 0;
int Diameter = 50;
int snelheid = 5;

void setup(){
  size(400,400);
}

void draw(){
 background(255);
 circle(BallX, BallY, Diameter);
 BallY = BallY + snelheid;
  if(BallY >= 550){
    BallY = 0;
    BallX = int(random(width));   
  }
 rect(mouseX - 25, 350, 50, 10);
}
