#!/bin/bash

planet -E -DCONST_1=10 -DCONST_2=20 -DCONST_3=30 -DCONST_4=40 \
    -DCONST_5=50 -DVAL_BONUS -Idir_1 -Idir_1/dir_2 -Idir_1/dir_2/dir_3 \
    -Idir_1/dir_2/dir_3/dir_4 -Idir_1/dir_2/dir_3/dir_4/dir_5 main.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./main
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0

