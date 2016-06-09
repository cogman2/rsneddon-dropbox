#!/bin/bash
# prints itself backwards
#
sed -n `1{h;T;};G;h;$p` $0
