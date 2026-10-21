ArrayList<Ball> balls;
Score score;
Levens levens;
int nextBallScore;

void setup()
{
  size(400, 400);
  
  balls = new ArrayList<Ball>();
  
  score = new Score();
  
  nextBallScore = 20;
  
  levens = new Levens();
  
  for(int i = 0; i < 3; i++)
  {
    balls.add(new Ball(int(random(width)), -i * 150));
  }
}

void draw()
{
  if(levens.levens <= 0)
  {
    background(255);
    
    textAlign(CENTER);
    textSize(40);
    fill(255,0,0);
    text("GAME OVER", width/2, height/2);
    
    textSize(40);
    text("Score: " + score.score, width/2, height/2 + 40);
    
    noLoop();
    
    return;
  }
    background(255);
    
  for(Ball b : balls)
  {
  b.updateRespawn();
  b.display();
  b.move();
  b.resetUitBeeld();
  b.raaktPaddel();
  }
  
  if(score.score >= nextBallScore)
  {
    balls.add(new Ball(int(random(width)), 0));
    nextBallScore += 20;
  }
  score.display();
  levens.display();
  
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
    levens.levens--;
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

class Levens
{
  int levens;
  
  Levens()
  {
  levens = 3;
  }
  
  void display()
  {
  textSize(20);
  fill(0);
  text("levens: " + levens, 10, 40);
  }
}
