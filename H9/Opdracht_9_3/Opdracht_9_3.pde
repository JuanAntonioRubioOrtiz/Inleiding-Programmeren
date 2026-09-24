int mijngetal;

void setup(){
 mijngetal = mijnMethode(10, 20);
  println(mijngetal);
  exit();
}

void draw(){
  
}

int mijnMethode(int cijfer, int cijfer2){
  int gemmidelde = (cijfer + cijfer2) / 2;
  return gemmidelde;
}
