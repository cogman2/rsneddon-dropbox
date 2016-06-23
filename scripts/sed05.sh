#!/usr/local/bin/bash
#
#set -x
IFS=$'\n'
#ls  | sed -n '/^[tmp]*/p' 
FILE_LIST=$(ls tmp  | sed -n '/^tmp[A-Za-z0-9]*\.txt$/p')
#FILE_LIST=$(ls tmp)
echo $FILE_LIST
for FILE in $FILE_LIST; do
#    echo "File before: $FILE"
#    sed -i.bak '1,3 d' "tmp/$FILE"
    sed -n '/man/s/^/*** This might have something to do with man and man pages ***\'$'\n/p' "tmp/$FILE"
#    cat "tmp/$FILE"
done