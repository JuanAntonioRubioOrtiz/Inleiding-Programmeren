void setup(){
Leerling LeerlingSam = new Leerling("Sam", 19);

LeerlingSam.toonLeerling();
}

class Leerling{
String naam;
int leeftijd;

Leerling(String zijnNaam, int zijnLeeftijd){
naam = zijnNaam;
leeftijd = zijnLeeftijd;
  }
  void toonLeerling(){
  println("Naam: " + naam);
  println("Leeftijd: " + leeftijd);
  }
}
