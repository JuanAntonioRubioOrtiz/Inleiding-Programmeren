void setup(){
spaarpot mijnSaldo = new spaarpot(55, 24, 47);
mijnSaldo.geldStorten();
mijnSaldo.geldOpnemen();
mijnSaldo.toonsaldo();
}

class spaarpot{
float saldo;
float geld;
float bedrag;

spaarpot(float Xsaldo, float Xgeld, float Xbedrag){
  saldo = Xsaldo;
  geld = Xgeld;
  bedrag = Xbedrag;
  }
  void geldStorten(){
  saldo = saldo + geld;
  }
  void geldOpnemen(){
  saldo = saldo - bedrag;
  }
  void toonsaldo(){
    if(saldo > 0){
  println("Saldo: " + saldo);
    }else{
    println("bankrupt!");
    }
  }
}
