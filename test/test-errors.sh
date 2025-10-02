#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat ../bin/backend_path.txt))"
cp print_errors.in ${BACKEND_PATH}/test/tools/
export EXTERN_EXT_IN="plx"
export EXTERN_TEST_DIR="${PWD}/tests/compiler"
export EXTERN_PACKAGE_PATH="$(readlink -f ..)"

cd ${BACKEND_PATH}/test/
./test-errors.sh ${@}
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
