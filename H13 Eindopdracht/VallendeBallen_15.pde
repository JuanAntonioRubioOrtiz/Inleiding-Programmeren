ArrayList<Ball> balls;
Score score;
Levens levens;
int nextBallScore;
PImage img;

void setup()
{
  size(400, 400);
  
  img = loadImage("https://happycoding.io/images/stanley-1.jpg");
  
  balls = new ArrayList<Ball>();
  
  score = new Score();
  
  nextBallScore = 100;
  
  levens = new Levens();
  
  for(int i = 0; i < 1; i++)
  {
    balls.add(new Ball(int(random(width)), -i * 150));
    balls.add(new SpecialBall(int(random(width)), -150));
    balls.add(new Bomb(int(random(width)), -200));
    balls.add(new LifeBall(int(random(width)), -400));
  }
}

void draw()
{
  if(levens.levens <= 0)
  {
    background(255);
    image(img, 0, 0);
    img.resize(400,400);
    
    textAlign(CENTER);
    textSize(40);
    fill(255,0,0);
    text("GAME OVER", width/2, height/2);
    
    textSize(40);
    text("Score: " + score.score, width/2, height/2 + 40);
    
    textSize(20);
    text("Press R to play", width/2, height/2 + 80);

    noLoop();
    return;
  }
    background(255);
    image(img, 0, 0);
    img.resize(400,400);
    
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

  fill(100);
  rect(mouseX - 25, 350, 50, 10);
}

void restartGame()
{
  score.score = 0;
  levens.levens = 3;
  nextBallScore = 100;
  
  balls.clear();
  
  balls.add(new Ball(int(random(width)), 0));
  balls.add(new SpecialBall(int(random(width)), -150));
  balls.add(new Bomb(int(random(width)), -200));
  balls.add(new LifeBall(int(random(width)), -400));
}

void keyPressed()
{
  if(levens.levens <= 0 && (key == 'r' || key == 'R'))
  {
    restartGame();
    loop();
  }
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
  levens = 3;
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
    Diameter = 20;
    snelheid = 4;
  
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
    Diameter = 20;
    snelheid = 4;
   }
 }
}

class Bomb extends Ball
{
  Bomb(int ballx,int bally)
  {
  super(ballx, bally);
  Diameter = 50;
  snelheid = 3;
  
  punten = -20;
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
    Diameter = 50;
    snelheid = 3;
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

class LifeBall extends Ball

{
  LifeBall(int ballx, int bally)
  {
    super(ballx, bally);
    Diameter = 10;
    snelheid = 4;
  }
  void display()
  {
    if(waiting)
    {
      return;
    }
    fill(0,255,0);
    circle(BallX, BallY, Diameter);
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
      levens.levens += 1;
      startRespawnTimer();
    }
 }
  void startRespawnTimer()
 {
   waiting = true;
   respawnTime = millis() + 14000;
 }
 void updateRespawn()
 {
 if(waiting && millis() >= respawnTime)
   {
    waiting = false;
    
    BallY = 0;
    BallX = int(random(width));
    Diameter = 10;
    snelheid = 4;
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
