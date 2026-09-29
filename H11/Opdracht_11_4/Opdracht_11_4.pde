int[] array = new int[10];
int[] array2 = new int[10];

void setup(){
for(int i = 0; i < array.length; i++){
  array[i] = i*12;
  }
  for(int i = 0; i < array2.length; i++){
    array2[0] = 0;
    array2[1] = 1;
    array2[2] = 2;
    array2[3] = 3;
    array2[4] = 4;
    array2[5] = 5;
    array2[6] = 6;
    array2[7] = 7;
    array2[8] = 8;
    array2[9] = 9;
    println(array2[i] + " * 12 = " + array[i]);
  }
}
