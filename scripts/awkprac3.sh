#!/usr/local/bin/bash
# 
awk 'BEGIN { FS=":" } { print "dn: uid=",$1, "dc=example, dc=com" } { print "cn: ", $2, $3 } { print "sn: ",$3 } { print "telephoneNumber: ",$4 } { print ""}' test2.txt 