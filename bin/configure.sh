#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat backend_path.txt))"
export EXTERN_PACKAGE_NAME="planet"

cd ${BACKEND_PATH}/bin/
./configure.sh
exit ${?}
