#!/usr/local/bin/bash
# 
# awk 'BEGIN { FS=":" } { print "dn: uid=",$1, "dc=example, dc=com" } { print "cn: ", $2, $3 } { print "sn: ",$3 } { print "telephoneNumber: ",$4 } { print ""}' test2.txt 
set -x
#dksp=$(df -h)
# awk 'BEGIN { FS=" " }{print $1 $2 $3 } dksp' 
#awk '{ for(i = 1; i <= NF; i++) { print $i; } }' dksp
#awk -v var="$dksp" 'BEGIN {print var}'
#FS="\t"
#for line in $dksp; do
#     echo $line  | awk 'BEGIN{ ORS="\n" };{ print $1}'
#done
#df -h  | awk 'BEGIN{ ORS="\n" };{ print $1, $2, $3, $4}'
#df -h -bk | awk 'BEGIN{ FS=" " };{ print $1, $2, $3}'
#myarr=$(df -h -bk  | awk 'BEGIN{ FS="\n" };{ print $1, $2, $3}')
#echo ${myarr[4]}
#for i in "${myarr[@]}}"; do 
#    echo $i
#done
df -h -k   | awk 'BEGIN { FS=" "; name1="none1"; name2="none2"; mem1=999999999999; mem2= 99999999999; nullname="Filesystem" };\
{if ($1=="map"){$1 = $1" "$2; $2=$3; $3=$4; $4=$5}};\
{diskname[$1] = $2 ; used[$2]++ ; total[$3]++ ;}\
#{print $1, $2, $3, $4} \
END {for (var in diskname) \
       {if ((var != nullname) && (diskname[var]<=mem1)) \
          {mem2 = mem1; \
           name2 = name1;
           mem1=diskname[var]; \
           name1 = var; } \
        } \
    { print "Smallest memory consumers are: "; print name1, mem1; print name2, mem2;}}'
#{print var, diskname[var] }'
#FS="\n"
#for item in $dksp; do 
#    echo $item
#    awk 'BEGIN { FS="\n" }{print $1, $2, $3, $4 }' 
#done