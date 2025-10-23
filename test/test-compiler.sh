#!/bin/bash

RESULT="$(echo "$(./test-compiler-cc.sh ${@} | tee /dev/tty)" | tail -1)"
if [[ "${RESULT}" == *"FAIL:"* ]]; then
    exit 1
fi

export TOTAL_CC=$(("$(echo "${RESULT}" | cut -d":" -f2- | tr -d ' ' | cut -d"/" -f1)"))
./test-compiler-plx.sh ${@}
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
