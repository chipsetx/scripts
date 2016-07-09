#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// sudo apt-get install espeak
// pour regler :
// sudo apt-get install stopwatch 

int main(int argc, const char * argv[])
{
 
 /* Define a temporary variable */
   char example[100];

   int i;
for(i=1;i<=6;i++){
    strcpy(example, "espeak 1");
   system(example);
   usleep(500);
    strcpy(example, "espeak 2");
   system(example);
   usleep(500);
    strcpy(example, "espeak 3");
   system(example);
   usleep(500);
    strcpy(example, "espeak 4");
   system(example);
   sleep(1);
    strcpy(example, "espeak 5");
   system(example);
   sleep(1);
    strcpy(example, "espeak 6");
   system(example);
   sleep(1);
    strcpy(example, "espeak 7");
   system(example);
   sleep(1);
    strcpy(example, "espeak 8");
   system(example);
   sleep(1);
    strcpy(example, "espeak 9");
   system(example);
   sleep(1);
    strcpy(example, "espeak 10");
   system(example);
   sleep(1);
}
   return 0;
}



