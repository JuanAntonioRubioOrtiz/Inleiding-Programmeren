float totaalAantalLessen = 20;
float gevolgdeLessen = 16;
float cijfer = 5.5;
float percentageLessenGevolgd = 0;

percentageLessenGevolgd = (gevolgdeLessen / totaalAantalLessen) * 100;

if(cijfer >= 5.5 && percentageLessenGevolgd >= 80){
  print("Geslaagd!");
}else{
  print("Gezakt");
}
