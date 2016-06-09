#!/usr/local/bin/bash
#set -x
shopt -s expand_aliases
alias BEGINCOMMENT="if [ 1 -eq 0 ]; then"
alias ENDCOMMENT="fi"
IFS=$'\n'
# Original command: df -h -k $1 | awk
# Next command: du -a -h -k

find $1 -type f -exec du -a -k {} +  | awk \
'BEGIN { FS=" "; name1="none1"; name2="none2"; mem1=99999; mem2=99999; nullname="Filesystem" };\
{if ($1 > 2) \
     {print "Delete/Compress/Quit [d/c/q]", $2,"?"; \
      getline name < "/dev/tty"; \
      if (name=="d") \
           {system("rm "$2); system("echo \"Deleted \""$2">>mylog.txt")} \
      else if (name=="c") \
           { \
           if ($2 ~ /\.tar|\.gz|\.bz2|\.zip/) 
              {print "File is already compressed"} \
           else { system("gzip "$2); system("echo \"Compressed \""$2">> mylog.txt")} \
           } \
      else \
           {exit 1} \
    }}; \
END {print "finished processing"}'


BEGINCOMMENT
'{diskname[$2] = $1 ; used[$2]++ ; total[$3]++ ;}\
END {for (var in diskname) \
       {if (diskname[var] >= 100) {print diskname[var], var;} \
        if ((var != nullname) && (diskname[var] >= mem1)) \
          {mem2 = mem1; \
           name2 = name1;
           mem1=diskname[var]; \
           name1 = var; } \
        else if ((var != nullname) && (diskname[var] >= mem2)) \
          {mem2 = diskname[var]; \
           name2 = var; } \
        } \
    { print "Largest memory consumers are: "; print name1, mem1; print name2, mem2;}}'
ENDCOMMENT
BEGINCOMMENT
file_list=$(find $1 -type f -exec du -a -k {} +)
for line in $file_list; do
#    for word in $line; do
        eval x=($line)
	if [ ${x[0]} -ge 2 ]; then
        	my_file=${x[1]}
		echo $my_file
		echo -n "backup, delete, quit [b/d/q]?"; read choice
		if [[ "$choice" == "d" ]]; then
		    rm "$my_file"
		    echo "Deleted $my_file" >> mylog.txt
		elif [[ "$choice" == "b" ]]; then
		    if [[ "tar" != "${my_file##*.}" ]] && [[ "zip" != "${my_file##*.}" ]] && [[ "gz" != "${my_file##*.}" ]] && [[ "bz2" != "${my_file##*.}" ]]; then
			gzip "$my_file"
			echo "Compressed $my_file" >> mylog.txt
		    else
			echo "File $my_file is already compressed"
		    fi
		elif [[ "$choice" == "q" ]]; then
		    break
		fi
	fi
#    done
done
ENDCOMMENT
#{print var, diskname[var] }'
#FS="\n"
#for item in $dksp; do 
#    echo $item
#    awk 'BEGIN { FS="\n" }{print $1, $2, $3, $4 }' 
#done