#!/usr/bin/awk -f
#BEGIN { x=0 }
#/^$/ { x=x+1 }
#END { print "I found " x " blank lines." }
BEGIN { x="3.03" }
/[A-Za-z]/ { x%=x+1.2 }
END { print "I got " x " stuffs" }