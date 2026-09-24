void setup(){
  size(200,200);
}

void draw(){
  background(255,255,255);
  tekenDriehoek(20,180,180,180,100,20);
}

void tekenDriehoek(int x1, int y1, int x2, int y2, int x3, int y3){
//bottom
  line(x1,y1,x2,y2);
  //right
  line(x1,y1,x3,y3);
  //left
  line(x2,y2,x3,y3);
}
