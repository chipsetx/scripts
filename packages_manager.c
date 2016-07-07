
	#include<stdio.h>
#include <string.h>
	int main(int argc, char *argv[])
	{
  char package[100];
char depends[100];
char deuxpoints[100];

    		FILE *ptr_file;
    		char buf[1000];
		  char *deuxpoint,*pack,*depend;
		int dependes,pack_start,deux_point,i=0;
    		ptr_file =fopen("Packages","r");
    		if (!ptr_file)
        		return 1;
   strcpy(package, "Package: ");
   strcpy(depends, "Depends:");
   strcpy(deuxpoints, ":");
   strcat(package, argv[1]);
    		while (fgets(buf,1000, ptr_file)!=NULL){
       			pack = strstr(buf, package);
       			depend = strstr(buf, depends);
       			deuxpoint = strstr(buf, deuxpoints);

			if(pack==NULL){  }else {  pack_start=1;}
			if(depend==NULL){ }else { dependes=1;}
			if(deuxpoint==NULL){ deux_point=0;}else {  deux_point=1;}

			if(pack_start==1 && i==0 && depend!=0){
				printf("%s", buf);
				i=1;		
				
			}
/*
			if(dependes==0 && deux_point==1){
			 i=1;
			}
*/			
				
		}

		fclose(ptr_file);
    		return 0;
	}
