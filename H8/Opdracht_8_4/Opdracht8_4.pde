size(700,350);
background(255,255,255);
int xWaarde = 100;
int yWaarde = 100;
for(int i = 0; i < 5; i++){
for(int j = 0; j < 2; j++){
rect(xWaarde, yWaarde, 100,100);
yWaarde = yWaarde + 100;
}
yWaarde = 100;
xWaarde = xWaarde + 100;
}
