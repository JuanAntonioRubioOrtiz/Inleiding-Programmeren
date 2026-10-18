int BallX = 200;
int BallY = 10;
int Diameter = 200;
int snelheid = 20;

void setup(){
size(400,400);
}

void draw(){
    background(255);
  circle(BallX, BallY, Diameter);
  BallY = BallY + snelheid;
}
