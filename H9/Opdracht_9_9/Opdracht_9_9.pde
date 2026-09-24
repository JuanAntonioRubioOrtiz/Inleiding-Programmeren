void setup(){
  size(200,200);
}

void draw(){
  background(255,255,255);
  tekenBoom(100,130);
}

void tekenBoom(int x,int y){
  //Stam
    fill(139, 69, 19);
    rect(x-10,y-40,20,100);
    
  //blad
    fill(34, 139, 34);
    ellipse(x,y-60,100,70);
}
