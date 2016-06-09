#!/usr/local/bin/bash
# 
set -x
gawk 'BEGIN {FS="\t"} \
  {if (NF != 0) \
      {print "<row>" "\n" "<entry>"$1"</entry>" \
       "\n" "<entry>"  } \
       { switch (NR) { \
           case 1: \
#              print NR; \
              print $2,$3,$4 "\n" "</entry>" "\n"  "</row>"; \
              break; \
           case 3: \
#              print NR; \
              print $3,$4 "\n" "</entry>" "\n"  "</row>"; \
              break; \
           case 5: \
#              print NR; \
              print $2,$3 "\n" "</entry>" "\n"  "</row>"; \
              break; \
           case 7: \
#              print NR; \
              print $2,$3,$4,$5,$6,$7,$8 "\n" "</entry>" "\n"  "</row>"; \
              break; \
           default: \
#              print "Count is: ", NR;
#              print "DEFAULT!" "\n"; \
              break; \
        } \
       } \
  }' tabdata.txt 
