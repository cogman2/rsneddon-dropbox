#!/usr/bin/awk -f
#
# First awk script
BEGIN {
        FS=":"
}
{ if ( $1 ~ /kerberos/ ) { print }}
# { print  }