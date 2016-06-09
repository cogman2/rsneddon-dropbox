#!/bin/bash
set -x
IFS=$" "
#sed '/\.sh/p' files.txt
ls | sed -n '/\.sh *$/p'
#ls | sed -r '/\.sh/P'

#myFiles=$(ls /Users/robertsneddon/DeepLearn/Working/scripts)
#echo $myFiles
#sed -e '/\.sh *$/P' ${myFiles}

exit