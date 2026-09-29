int[] array ={10,67,20,30,50,67,76,67,98,10};

void setup(){
telHoeVaakGetalVoorkomt(67);
telHoeVaakGetalVoorkomt(10);
}

int telHoeVaakGetalVoorkomt(int zoekwaarde){
int aantal = 0;
  for(int i = 0; i < array.length; i++){
if (array[i] == zoekwaarde){
    aantal++;
    }
  }
println("Het getal " + zoekwaarde + " komt " + aantal + " keer voor.");
return aantal;
}
