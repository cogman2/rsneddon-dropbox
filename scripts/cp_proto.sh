#!/usr/local/bin/bash
#
# backs up home files of a certain age in a tar ball
#
# set -x
IFS=$'\n'
# my_files=$(find /data/oird_fcn -type f -mtime -30  -name "*.prototxt")
my_files=$(find /data/oird_fcn -type f  -mtime -30 -name "*.prototxt" | xargs ls -t)
#my_files=$(find ~ -type f -mtime -1)
my_files_list=""
first_file=0
for word in $my_files; do
    echo $word
    echo ${word##*/}
    echo ${word#/data/oird_fcn}
: '    echo "${word##*/}"
    echo "${word##*.}"
    if [[ "tar" != "${word##*.}" ]]; then
	if [ "$first_file" -eq "0" ]; then
	    name=$(basename $word)
	    tar -cf ${name}.tar $word
            my_files_list="$my_files_list${word##*/}"
	    echo "file list is: "
	    echo $my_files_list
	    first_file=1
	    tar_file_name="${name}.tar"
	else
	    name=$(basename $word)
	    tar --append --file=$tar_file_name $word
#            my_files_list="$my_files_list${word##*/}"
	fi
     fi
'
done
#gzip  *.tar
#gzip $tar_file_name
#tar -cvzf $my_files_list
exit 0