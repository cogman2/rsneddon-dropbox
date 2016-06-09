#!/usr/local/bin/bash
#
awk 'BEGIN { FS=":" } {  print "Month Crates"
              print "----- ------" }
           {  print $1, $2 }' test2.txt