#!/bin/bash
#
# backs up home files of a certain age in a tar ball
#
set -x
IFS=$'\n'
if [ $# -eq 0 ]; then
    echo "Usage: ./sdel.sh file1 file2 file3 file4 ... fileN"
    exit 1
fi

if [ ! -d ~/TRASH ]; then
    mkdir ~/TRASH
else
    DEL_FILES=$(find ~/TRASH -type f -mtime -2)
    if [ $DEL_FILES -ne "" ]; then
	for FILE in $DEL_FILES; do
	    rm $FILE
	done
    fi
fi


declare -A FILES
NUM_FILES=0
while [ $# -gt 0 ]; do
    if [ -f $1 ]; then
	FILES[$NUM_FILES]=$1
	NUM_FILES=NUM_FILES+1
    else
	echo "$1 is not a valid filename"
    fi
    shift
done

for num in $(seq 0 $NUM_FILES); do
    mv ${FILES[$num]} ~/TRASH
done
exit 0

