int co;

void setup(){
  size(200,200);
  
}
void draw(){
  background(255,255,255);
  vierkant(20,20,150,150);
}

void vierkant(int x, int y, int w, int h){
  //top line
  line(x,y,w+x,y);
  //bottom line
  line(x,y+h,w+x,y+h);
  //left line
  line(x,y,x,y+h);
  //right line
  line(x+w,y,x+w,y+h);
}
