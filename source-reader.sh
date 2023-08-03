



#!/bin/sh

Name="world"

############################################################
Help()
{
   # Display Help
   echo "source-reader"
   echo "options:"
   echo "-c       Print .c files."
   echo "-e       Print .h files."
   echo "-i file  Print includes in a file."
   echo "-f       Print function list of a file."
   echo "-h       Print help."
   echo
}

############################################################



while getopts "hcei:f:" option; do
   case $option in
      h) # display Help
         Help
         exit;;
      i) # Enter a name
         Name=$OPTARG
	#echo "hello $Name!"
        grep --color "^#include" $Name
	exit;;
      f) # affiche tout les fichiers headers
	 Name=$OPTARG
	ctags -x --c-types=f $Name |cut -d" " -f1
	exit;; 
      c) 
	find . -type f -name "*.c"|grep --color "\.c"
	exit;;
      e) # affiche tout les fichiers headers
	find . -type f -name "*.h"|grep --color "\.h"
	exit;;      
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done





#find . -type f -name "*.c"
#find . -type f -name "*.h"
#grep  "^#include" archives.c
#ctags -x --c-types=f archives.c |cut -d" " -f1
#ctags -x --c-types=f archives.c|cut -c51-
