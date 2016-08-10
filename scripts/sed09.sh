#!/usr/local/bin/bash
#
#set -x
IFS=$'\n'
#IFS=$' '
# declare -A LIST_OF_LISTS
#ls  | sed -n '/^[tmp]*/p' 
#FILE_LIST=$(ls /  | sed -n '/^tmp[A-Za-z0-9]*\.txt$/p')
if [ $# -ne 1 ]; then
    echo "Usage: ./sed09.sh FILENAME"
    exit
fi

FILE=$1
if [ ! -f $FILE ];
    echo "$FILE does not exist"
    exit
fi

LINES=$(cat -n $FILE | sed -n '/\w+$/p')

echo "These lines in $FILE have trailing whitespace:"
echo ""
for LINE in $LINES; do
    echo $LINE
done



LIST_OF_LISTS[0]=$(ls -F /  | sed -n '/\@$/p')
a_list=$(ls -F /  | sed -n '/\@$/p')
LIST_OF_LISTS[1]=$(ls -F /  | sed -n '/\/$/p')
LIST_OF_LISTS[2]=$(ls -F / | sed -n '/[^\/\@]$/p')
#FILE_LIST=$(ls tmp)
# echo $a_list
# echo "This is a_list"
# echo ${LIST_OF_LISTS[0]}
# echo "List 1"
# echo ${LIST_OF_LISTS[1]}
# echo "List 2"
# echo ${LIST_OF_LISTS[2]}
# echo "List 3"

for num in $(seq 0 2); do
#    echo $num
    for FILE in ${LIST_OF_LISTS[$num]}; do
        if [ $num -eq 0 ]; then
	    echo "--This is a symlink--" $FILE
        elif [ $num -eq 1 ]; then
	    echo $FILE
        else
	    echo $FILE "<---This is a plain file"
	fi
    done

#    echo "File before: $FILE"
#    sed -i.bak '1,3 d' "tmp/$FILE"
#    sed -n '/man/s/^/*** This might have something to do with man and man pages ***\'$'\n/p' "tmp/$FILE"
#    cat "tmp/$FILE"
done

