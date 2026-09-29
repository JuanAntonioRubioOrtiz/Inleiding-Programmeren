boolean bestaat;
String[] namen ={"Jan", "Jose", "Fernando", "Rick"};

void setup(){
bestaat = false;
for(int i = 0; i < namen.length; i++){
  if(namen[i] == "Jan"){
  bestaat = true;
    }
  }
  println(bestaat);
}
