#!/usr/local/bin/bash
#
# Using Bash 4.0
#
#set -x
#declare -a primes
#declare 
primes[1]=
prime_count=0
test_int=3
divide_int=1
prime_search() {
# Loop from 2 to 31500
    for i in `seq 950 1050`; do
	# echo "i is: " $i
	(( test_int=test_int+1 ))
	halfi=$(echo "(($i/2.0)+0.5)/1" | bc )
	# echo "half_i is: " $halfi
	for j in $(seq 2 $halfi); do
#	for j in `seq 2 7`; do
	    # echo "j is " $j
	    (( divide_int=divide_int+1 ))
	    # echo "divide_int is "$divide_int
	    ratio=$( echo $i/$j | bc -l ) 
#	    (( ratio=test_int/divide_int ))
	    # echo "ratio is" $ratio
	    int=$(echo "($ratio+0.5)/1" | bc )
	    # echo "int is: " $int
	    if (( $(echo "$ratio==$int"| bc -l) )); then
		# echo "ratio = int "
		break

	    elif (( $(echo "$j==$halfi"| bc -l) )); then
		prime_count=$(($prime_count+1))
		# echo "prime_count is: " $prime_count
		primes[$prime_count]=$i
		# echo "prime is: " ${primes[$prime_count]}
	    fi
	done
    done
}

prime_search
printf "\nPrimes are: \n"
for i in $(seq 1 $prime_count); do
    printf "%6d \n" ${primes[$i]}
done
    