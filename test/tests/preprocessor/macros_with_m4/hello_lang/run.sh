#!/bin/bash

planet -E -DJAVA_LANG -Iliblang/ hello.plx
if [ ${?} -ne 0 ]; then exit 1; fi

./hello
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
