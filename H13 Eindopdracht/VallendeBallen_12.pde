ArrayList<Ball> balls;
Score score;
Levens levens;
int nextBallScore;

void setup()
{
  size(400, 400);
  
  balls = new ArrayList<Ball>();
  
  score = new Score();
  
  nextBallScore = 100;
  
  levens = new Levens();
  
  for(int i = 0; i < 1; i++)
  {
    balls.add(new Ball(int(random(width)), -i * 150));
    balls.add(new SpecialBall(int(random(width)), -150));
    balls.add(new Bomb(int(random(width)), -200));
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
    nextBallScore += 100;
  }
  score.display();
  levens.display();

  stroke(0, 0, 0);
  fill(100);
  rect(mouseX - 25, 350, 50, 10);
}
  
class Ball{
  int BallX;
  int BallY;
  int Diameter;
  int snelheid;
  int punten;
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
    punten = snelheid + (60 - Diameter)/10;
  }

  void display()
  {
    if (waiting)
    {
      return;
    }
    fill(255, 100, 100);
    circle(BallX, BallY, Diameter);
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
      score.score += punten;
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
    punten = snelheid + (60 - Diameter)/10;
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
  levens = 5;
  }
  
  void display()
  {
  textSize(20);
  fill(0);
  text("levens: " + levens, 10, 40);
  }
}

class SpecialBall extends Ball
{
  SpecialBall(int ballx, int bally)
  {
    super(ballx, bally);
  
    punten = 50;
  }
  void display()
  {
    if(waiting)
    {
      return;
    }
    fill(255,255,0);
    circle(BallX, BallY, Diameter);
  }
  void startRespawnTimer()
 {
   waiting = true;
   respawnTime = millis() + 10000;
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

class Bomb extends Ball
{
  Bomb(int ballx,int bally)
  {
  super(ballx, bally);
  
  punten = -10;
  }
  void display()
  {
    if(waiting)
    {
      return;
    }
    fill(255,0,0);
    circle(BallX, BallY, Diameter);
  }
  void startRespawnTimer()
 {
   waiting = true;
   respawnTime = millis() + 7000;
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
}
