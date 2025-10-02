#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat backend_path.txt))"
FILENAME_EXT="plx"
PACKAGE_NAME="planet"
PACKAGE_PATH="$(readlink -f ..)"

cd ${BACKEND_PATH}/bin/

echo -n "${FILENAME_EXT}" > ./filename_ext.txt
if [ ${?} -ne 0 ]; then
    echo -e "\033[0;31merror:\033[0m configuration failed" 1>&2
    exit 1
fi
echo -n "${PACKAGE_PATH}" > ./package_path.txt
if [ ${?} -ne 0 ]; then
    echo -e "\033[0;31merror:\033[0m configuration failed" 1>&2
    exit 1
fi

# TODO for includes use .etc
# TODO install m4 as preprocessor
# TODO preprocess with m4 in wheelcc/bin/driver.sh
# TODO link with build/build_lib in wheelcc/bin/driver.sh

EXTERN_PACKAGE_NAME="planet" # TODO rm
./configure.sh "${PACKAGE_NAME}"
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
