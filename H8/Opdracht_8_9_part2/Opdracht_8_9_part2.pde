size(200,200);
background(255,255,255);
int sizeC = 200;
for(int i = 0; i < 50; i++){
ellipse(0 + sizeC/2, 0 + sizeC/2, sizeC,sizeC);
sizeC = sizeC - 3;
println(sizeC);
}
