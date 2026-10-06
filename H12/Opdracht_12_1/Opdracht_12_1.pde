Rechthoek mijnRechthoek;

void setup(){
size(400,400);
mijnRechthoek = new Rechthoek(200,200,100,100);
}

void draw(){
background(255);
mijnRechthoek.teken();
}

class Rechthoek{
float x;
float y;
float w;
float h;

Rechthoek(float startX, float startY, float startW, float startH){
x = startX;
y = startY;
w = startW;
h = startH;
  }
  void teken(){
  rect(x,y,w,h);
  }
}
