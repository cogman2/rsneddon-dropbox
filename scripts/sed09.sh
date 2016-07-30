#!/usr/local/bin/bash
#
#set -x
IFS=$'\n'
if [[ $# -eq 1 ]]; then
    FILE=$1
else
    echo "Usage: ./sed09.sh FILENAME"
    exit
fi

if [ ! -f $FILE ]; then
    echo "File not found!"
    exit
fi


#CAT_FILE=$(cat -n $FILE  | sed -n '/\s+$/p')
CAT_FILE=$(cat -n $FILE )

#a_list=$(ls -F /  | sed -n '/\@$/p')
#LIST_OF_LISTS[1]=$(ls -F /  | sed -n '/\/$/p')

for LINE in $CAT_FILE; do
    echo $LINE "<---Has trailing whitespace"
done 

