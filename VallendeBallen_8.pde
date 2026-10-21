Ball[] ball;
Score score;

void setup()
{
  size(400, 400);
  
  ball = new Ball[3];
  
  score = new Score();
  
  for(int i = 0; i < 3; i++)
  {
    ball[i] = new Ball(int(random(width)), -i * int(random(100,300)));
  }
}

void draw()
{
    background(255);
    
  for(int i = 0; i < 3; i++)
  {
  ball[i].updateRespawn();
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
  boolean waiting;
  int respawnTime;

  Ball(int ballx, int bally)
  {
    BallX = ballx;
    BallY = bally;
    Diameter = int(random(10,60));
    snelheid = int(random(2,4));
    waiting = false;
    respawnTime = 0;
  }

  void display()
  {
    if(!waiting)
    {
    circle(BallX, BallY, Diameter);
    }
  }
 void move()
 {
   if(!waiting)
   {
     BallY += snelheid;
   }
 }
 void resetUitBeeld()
 {
   if(waiting)
   {
    return;
   }
   if (BallY >= 400 + Diameter)
   {
    startRespawnTimer();
   }
 }
 void raaktPaddel()
 {
   if(waiting)
   {
     return;
   }
   
   if (BallY + Diameter/2 >= 350 &&
     BallX >= mouseX - 25 &&
     BallX <= mouseX + 25)
     {
      score.score++;
      startRespawnTimer();
    }
 }
 void startRespawnTimer()
 {
   waiting = true;
   respawnTime = millis() + 2000;
 }
 void updateRespawn()
 {
 if(waiting && millis() >= respawnTime)
   {
    waiting = false;
    
    BallY = 0;
    BallX = int(random(width));
    Diameter = int(random(10,60));
    snelheid = int(random(2,4));
   }
 }
}

class Score
{
  int score;
  
  Score()
  {
  score = 0;
  }

  void display()
  {
    textSize(20);
    fill(0);
    text("score: " + score, 10,20);
  }
}
