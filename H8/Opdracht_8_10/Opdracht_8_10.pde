size(200,200);
background(255,255,255);
int co = 0;
for(int i = 0; i < 5; i++){
  rect(20 + co, 20 + co, 30,30);
  co = co + 30;
  println(co);
}
