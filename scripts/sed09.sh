#!/bin/bash
#
#set -x
IFS=$'\n'
#IFS=$' '
if [ $# -ne 1 ]; then
    echo "Usage: ./sed09.sh filename"
    exit
fi

FILE=$1
if [ ! -f $FILE ]; then
    echo "$FILE does not exist"
    exit
fi

#LINES=$(cat -n $FILE | sed -n '/\w+$/p')
LINES=$(cat -n $FILE | sed -n '/\s\+$/p')

echo "These lines in $FILE have trailing whitespace:"
echo ""
for LINE in $LINES; do
    echo $LINE
done



#LIST_OF_LISTS[0]=$(ls -F /  | sed -n '/\@$/p')

#for num in $(seq 0 2); do
#    echo $num
#    for FILE in ${LIST_OF_LISTS[$num]}; do
#        if [ $num -eq 0 ]; then
#	    echo "--This is a symlink--" $FILE
#        elif [ $num -eq 1 ]; then
#	    echo $FILE
#        else
#	    echo $FILE "<---This is a plain file"
#	fi
#    done

#    echo "File before: $FILE"
#    sed -i.bak '1,3 d' "tmp/$FILE"
#    sed -n '/man/s/^/*** This might have something to do with man and man pages ***\'$'\n/p' "tmp/$FILE"
#    cat "tmp/$FILE"
#done

