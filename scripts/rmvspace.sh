#!/bin/bash
#
# Reads in a file, double spaces it and prints it out
#
if [ $# -ne 1 ]; then
    echo "Wrong number of parameters."
    exit 1
elif [ -f $1 ]; then
    FILE_NAME=$1
else
    echo "No file with that name."
    exit 1
fi
IFS=$'\n'
for next in `cat $FILE_NAME`
do
    if [ $next = "" ]; then
	continue
    else
	echo "$next read from $FILE_NAME"
    fi
done
exit 0
    
    
    