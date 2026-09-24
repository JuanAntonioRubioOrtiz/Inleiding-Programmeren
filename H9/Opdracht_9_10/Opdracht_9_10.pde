void setup(){
  size(200,200);
}

void draw(){
  background(255,255,255);
 tekenBos();
}

void tekenBoom(int x,int y){
  //Stam
    fill(139, 69, 19);
    rect(x-10,y-40,20,100);
    
  //blad
    fill(34, 139, 34);
    ellipse(x,y-60,100,70);
}

void tekenBos(){
for(int x = 20; x <= 180; x += 40){
tekenBoom(x,140);
}
}
