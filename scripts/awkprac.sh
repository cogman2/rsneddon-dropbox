#!/usr/local/bin/bash
#
# Using Bash 4.0
#
# awk '{ print "" }' /etc/passwd
awk -F":" '{ print "Username: " $1 "\t\tuid: " $3 }' /etc/passwd
awk "BEGIN {
             FS=":"
            }
           { print $1 } /etc/passwd "