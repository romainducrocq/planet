#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat ../bin/backend_path.txt))"
export EXTERN_EXT_IN="plx"
export EXTERN_TEST_DIR="${PWD}/tests/compiler"

cd ${BACKEND_PATH}/test/
./test-memory.sh ${@}
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
