#!/usr/local/bin/bash
#
# Parse /etc/passwd, and output its contents in nice, easy-to-read tabular form
# A script to parse passwd into understandable format
# The whole thing screams awk! sed!
#
#set -x
shopt -s expand_aliases
alias BEGINCOMMENT="if [ 1 -eq 0 ]; then"
alias ENDCOMMENT="fi"
IFS=$'\n'
awk -F "BEGIN { FS=":"  }  { print $1 } /etc/passwd "
FILE=$(cat /etc/passwd)
awk 'BEGIN { FS=":" } { print "dn: uid=",$1, "dc=example, dc=com" } { print "cn: ", $2, $3 } { print "sn: ",$3 } { print "telephoneNumber: ",$4 } { print ""}' test2.txt 
BEGINCOMMENT
awk 'BEGIN {
    FS=":"
}
{
    if ( $1 == "_dovenull" )
    {
	if ( $3 == 227 )
	{
	    print "foo"
	}
	else
	{
	    print "no foo"
	}
    }
    else if ( $3 == "bar" )
    {
	    print "something is wrong"
    }
    else
    {
	print "shouldnt be here"
    }
}' /etc/passwd
ENDCOMMENT