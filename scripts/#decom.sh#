#!/bin/bash
#
# Auto-decompresses a list of  files
#
# declare -A arr
set -x
comp[0]="*.zip"
comp[1]="*.gz"
comp[2]="*.bz2"
comp[3]="*.tar"
com[0]="unzip"
com[1]="gunzip"
com[2]="bzip2 -d" 
com[3]="tar -xvf"
if [ $# -ne 1 ]; then
    echo "Wrong number of arguments."
    echo "Usage: decom.sh filename"
    exit 1
elif [ ! -f $1 ]; then
    echo "File does not exist"
    exit 1
else
    SOURCE_FILE=$1
fi

while read line; do
#     count=1
     echo "This line is: $line"
     for i in {0..3}; do
	  echo ${comp[i]}
#          if [ grep $comp[$i] $line ]; then
	  if [[ $line == ${comp[i]} ]]; then
# Change to "file" command to find type
	      ${com[i]} $line
	      break
	  fi
	  if [ $i -eq 3 ]; then 
              echo "$line is not a compressed file."
	  fi
#	  count=$count+1
     done     
done < $SOURCE_FILE

	 
	 