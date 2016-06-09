#!/usr/local/bin/bash
#set -x
shopt -s expand_aliases
alias BEGINCOMMENT="if [ 1 -eq 0 ]; then"
alias ENDCOMMENT="fi"
IFS=$'\n'

find $1 -type f -exec du -a -k {} +  | awk \
'BEGIN { FS=" "; };\
{if ($1 > 2) \
     {print "Compress/Delete/Quit/Skip [c/d/q/s]", $2,"?"; \
      getline name < "/dev/tty"; \
      if (name=="d") \
           {system("rm "$2); system("echo \"Deleted \""$2">>mylog.txt")} \
      else if (name=="c") \
           { \
           if ($2 ~ /\.tar|\.gz|\.bz2|\.zip/) 
              {print "File is already compressed"} \
           else { system("gzip "$2); system("echo \"Compressed \""$2">> mylog.txt")} \
           } \
      else if (name=="s") \
           { next; }
      else \
           {exit 1} \
    }}; \
END {print "Finished processing"}'
