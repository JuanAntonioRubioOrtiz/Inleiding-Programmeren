int[] array ={10,67,20,30,50,67,76,67,98,10};

int zoekwaarde = 67;
int aantal = 0;

void setup(){
for(int i = 0; i < array.length; i++){
if (array[i] == zoekwaarde){
    aantal++;
}
  }
  
println("Het getal " + zoekwaarde + " komt " + aantal + " keer voor.");
}
