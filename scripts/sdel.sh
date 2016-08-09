#!/usr/local/bin/bash
#
# Puts files in a TRASH folder and empties that folder for old files.
#
#set -x
IFS=$'\n'
if [ $# -eq 0 ]; then
    echo "Usage: ./sdel.sh file1 file2 file3 file4 ... fileN"
    exit 1
fi

if [ ! -d ~/TRASH ]; then
    mkdir ~/TRASH
else
    DEL_FILES=$(find ~/TRASH -type f -mtime -14)
#    DEL_FILES=$(find ~/TRASH -type f )
    if [[ ! -z $DEL_FILES ]]; then
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
	NUM_FILES=$((NUM_FILES+1))
    else
	echo "$1 is not a valid filename"
    fi
    shift
done

for num in $(seq 0 $((NUM_FILES-1))); do
    mv ${FILES[$num]} ~/TRASH
done
exit 0

