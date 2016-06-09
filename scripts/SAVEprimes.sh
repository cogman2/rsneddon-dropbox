#!/usr/local/bin/bash
#
# Using Bash 4.0
#
set -x
declare -A primes
declare 
primes=()
prime_count=0

prime_search() {
# Loop from 2 to 31500
#    for i in `seq 60000 63000`; do
    for i in `seq 4.0 5.0`; do
#	for j in `seq 2 31500`; do
	for j in `seq 2.0 3.0`; do
	    
# Divide and check for remainder
	    ratio=$( echo $i/$j | bc -l ) 
	    int=$(echo "($ratio+0.5)/1" | bc )
	    if (( ratio  =  int )); then
		break
#	    elif [ $j -eq 31500 ]; then
	    elif [ $j -eq 4 ]; then
		prime_count=$(($prime_count+1))
		primes[$prime_count]=$i
	    fi
	done
    done
}

prime_search
for i in {1...$prime_count}; do
    printf $(primes[$i])
done
    