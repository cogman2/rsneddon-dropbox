#!/usr/local/bin/bash
#
# Returns a True or False according to whether the value read is a string or an integer
#
set -x
#noquote=$(echo "$1" | sed -e 's/^"//'  -e 's/"$//')
noquote=$(echo "$1" | sed -e 's/^`//'  -e 's/`$//')

echo $1
echo $noquote
answer=$(expr $1 + 0)
echo $answer
if [[ $answer -eq "" ]]; then
    echo "False"
else
    echo "True"
fi