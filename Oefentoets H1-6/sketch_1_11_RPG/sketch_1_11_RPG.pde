int steen1 = 1;
int steen2 = 1;
int steen3 = 1;
String resultaat = "";
int schade = 0;

schade = (steen1 + steen2 + steen3)/3;

if(steen1 + steen2 + steen3 == 3){
  resultaat = "Critical MISS!";
}else if(steen1 == 1){
  resultaat = "mis!";
}else if(steen2 == 1){
  resultaat = "mis!";
}else if(steen3 == 1){
  resultaat = "mis!";
}else if(steen1 + steen2 + steen3 == 18){
  resultaat = "nice!";
}else{
  resultaat = schade + "HIT!";
}
print(resultaat);
