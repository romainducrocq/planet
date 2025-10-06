#!/bin/bash

PACKAGE_BUILD="$(dirname $(readlink -f ${0}))"
PACKAGE_DIR="$(dirname ${PACKAGE_BUILD})/bin"
PACKAGE_NAME="$(cat ${PACKAGE_DIR}/pkgname.cfg)"
PACKAGE_LIBC="${PACKAGE_DIR}/libc"
CC="gcc"
if [[ "$(uname -s)" = "Darwin"* ]]; then
    CC="clang -arch x86_64"
fi

function build_so () {
    FILE="${1}"
    echo "${PACKAGE_LIBC}/${FILE}.o -> ${PACKAGE_LIBC}/lib${FILE}.so"
    ${CC} ${PACKAGE_LIBC}/${FILE}.c -c -fPIC -o ${PACKAGE_LIBC}/${FILE}.o
    if [ ${?} -ne 0 ]; then exit 1; fi
    ${CC} ${PACKAGE_LIBC}/${FILE}.o -shared -o ${PACKAGE_LIBC}/lib${FILE}.so
    if [ ${?} -ne 0 ]; then exit 1; fi
}

echo "-- Build libc ..."
build_so "print"
echo "OK"

exit 0
