#!/usr/local/bin/bash
#
set -x
ls /usr/bin | sed -n '/^[a-zA-Z]a/p' > tmp.txt