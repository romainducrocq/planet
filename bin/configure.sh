#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat backend_path.txt))"
export EXTERN_PACKAGE_NAME="planet"

find ${PWD}/ -maxdepth 1 -name "driver.sh" -type l -delete
if [ ${?} -ne 0 ]; then exit 1; fi
ln -s ${BACKEND_PATH}/bin/driver.sh ${PWD}/driver.sh
if [ ${?} -ne 0 ]; then exit 1; fi

cd ${BACKEND_PATH}/bin/
./configure.sh
if [ ${?} -ne 0 ]; then exit 1; fi
