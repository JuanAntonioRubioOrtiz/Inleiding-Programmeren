int first = 0;
int second = 1;
int n = 10;

 for(int i = 0; i < n; i++) {
   print(first + " ");
   
   int next = first + second;
   first = second;
   second = next;
 }
