#!/bin/bash

PACKAGE_BUILD="$(dirname $(readlink -f ${0}))"
PACKAGE_DIR="$(dirname ${PACKAGE_BUILD})/bin"
PACKAGE_NAME="$(cat ${PACKAGE_DIR}/pkgname.cfg)"
PACKAGE_LIBC="${PACKAGE_DIR}/libc"
CC="gcc"
if [[ "$(uname -s)" = "Darwin"* ]]; then
    CC="clang -arch x86_64"
fi

CC_FLAGS="-O3 -Wall -Wextra -Wpedantic -pedantic-errors"
LIBC_NAME="${PACKAGE_LIBC}/libplx.so"

OBJECT_FILES=""
function build_obj () {
    FILE="${PACKAGE_LIBC}/${1}"
    OBJECT="${FILE%.*}.o"
    OBJECT_FILES="${OBJECT_FILES} ${OBJECT}"
    echo "${FILE} -> ${OBJECT}"
    ${CC} ${FILE} ${CC_FLAGS} -c -fPIC -o ${OBJECT}
    if [ ${?} -ne 0 ]; then exit 1; fi
}

echo "-- Build libc ..."
build_obj "wrap_defs.c"
build_obj "wrap_vargs.c"

${CC} ${OBJECT_FILES} ${CC_FLAGS} -shared -o ${LIBC_NAME}
if [ ${?} -ne 0 ]; then exit 1; fi

echo "-- Created lib ${LIBC_NAME}"

exit 0
