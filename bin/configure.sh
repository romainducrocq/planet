#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat backend_path.txt))"
export EXTERN_PACKAGE_NAME="planet"

# TODO install m4 as preprocessor
cd ${BACKEND_PATH}/bin/
./configure.sh
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
