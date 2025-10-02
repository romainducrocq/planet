#!/bin/bash

PACKAGE_DIR="$(dirname $(readlink -f ${0}))"
BACKEND_PATH="$(readlink -f ${PACKAGE_DIR}/$(cat ${PACKAGE_DIR}/backend_path.txt))"
# TODO for includes use .etc
export EXTERN_EXT_IN="plx"

# TODO preprocess with m4 in wheelcc/bin/driver.sh
# TODO link with build/build_lib in wheelcc/bin/driver.sh
${BACKEND_PATH}/bin/driver.sh ${@}
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
