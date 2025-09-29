#!/bin/bash

PACKAGE_DIR="$(dirname $(readlink -f ${0}))"
BACKEND_PATH="$(readlink -f ${PACKAGE_DIR}/$(cat ${PACKAGE_DIR}/backend_path.txt))"
export EXTERN_EXT_IN="pl"

${BACKEND_PATH}/bin/driver.sh ${@}
if [ ${?} -ne 0 ]; then exit 1; fi
