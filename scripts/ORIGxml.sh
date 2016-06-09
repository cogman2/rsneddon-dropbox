#!/usr/local/bin/bash
# 
set -x
#df -h -k   | awk 'BEGIN { FS="\t"; name1="none1"; name2="none2"; mem1=999999999999; mem2= 99999999999; nullname="Filesystem" };\
#{if ($1=="map"){$1 = $1" "$2; $2=$3; $3=$4; $4=$5}};\
#{diskname[$1] = $2 ; used[$2]++ ; total[$3]++ ;}\
#{print $1, $2, $3, $4} \
#END {for (var in diskname) \
#       {if ((var != nullname) && (diskname[var]<=mem1)) \
#          {mem2 = mem1; \
#           name2 = name1;
#           mem1=diskname[var]; \
#           name1 = var; } \
#        } \
#    { print "Smallest memory consumers are: "; print name1, mem1; print name2, mem2;}}'
awk 'BEGIN {FS="\t"} \
  {if (NF != 0) \
      {print "<row>" "\n" "<entry>"$1"</entry>" \
       "\n" "<entry>" "\n" } \
       { switch (NR) { \
           case 1: \
              $2,$3,$4 "\n" "</entry>" "\n"  "</row>" \
              break \
           case 2: \
              $3,$4 "\n" "</entry>" "\n"  "</row>" \
              break \
           case 3: \
              $2,$3 "\n" "</entry>" "\n"  "</row>" \
              break \
           case 4: \
              $2,$3,$4,$5,$6,$7,$8 "\n" "</entry>" "\n"  "</row>" \
              break \
           default: \
              "DEFAULT!" "\n" \
              break \
        } \
       } \
  }' tabdata.txt 
#{print var, diskname[var] }'
#FS="\n"
#for item in $dksp; do 
#    echo $item
#    awk 'BEGIN { FS="\n" }{print $1, $2, $3, $4 }' 
#done