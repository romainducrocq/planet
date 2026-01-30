#!/usr/bin/env bash

PACKAGE_BUILD="$(dirname $(readlink -f ${0}))"
PACKAGE_DIR="$(dirname ${PACKAGE_BUILD})/bin"
PACKAGE_NAME="$(cat ${PACKAGE_DIR}/pkgname.cfg)"
PACKAGE_LIBC="${PACKAGE_DIR}/libc"
CC="gcc"
if [[ "$(uname -s)" == "Darwin"* ]]; then
    CC="clang -arch x86_64"
fi

CC_FLAGS="-O3 -Wall -Wextra -Wpedantic -pedantic-errors"
LIBC_NAME="${PACKAGE_LIBC}/libplanet.so"

function build_lib () {
    LIB_NAME="${PACKAGE_LIBC}/${1}"
    FILES_SIZE=${2}
    FILES="${@:3:${FILES_SIZE}}"
    FLAGS="${@:$((3+${FILES_SIZE}))}"
    BUILD_FLAGS="${CC_FLAGS} ${FLAGS}"
    OBJECT_FILES=""
    for FILE in ${FILES}; do
        FILE="${PACKAGE_LIBC}/${FILE}"
        OBJECT="${FILE%.*}.o"
        OBJECT_FILES="${OBJECT_FILES} ${OBJECT}"
        if [ "${LIB_NAME}" = "${LIBC_NAME}" ]; then
            echo "${FILE} -> ${OBJECT}"
        fi
        ${CC} ${FILE} ${BUILD_FLAGS} -c -fPIC -o ${OBJECT}
        if [ ${?} -ne 0 ]; then exit 1; fi
    done
    if [ ! "${LIB_NAME}" = "${LIBC_NAME}" ]; then
        echo "${FILE} ${FLAGS} -> ${LIB_NAME}"
    fi
    if [[ "$(uname -s)" == "Darwin"* ]]; then
        BUILD_FLAGS="${BUILD_FLAGS} -undefined dynamic_lookup"
    fi
    ${CC} ${OBJECT_FILES} ${BUILD_FLAGS} -shared -o ${LIB_NAME}
    if [ ${?} -ne 0 ]; then exit 1; fi
}

echo "-- Build libc ..."

build_lib "$(basename "${LIBC_NAME}")" 2 "wrap_defs.c" "wrap_vargs.c"
build_lib "libmath2.so" 1 "wrap_math.c" # "-lm"
build_lib "libsignal.so" 1 "wrap_fptrs.c" "-DBUILD_SIGNAL"
build_lib "libat_quick_exit.so" 1 "wrap_fptrs.c" "-DBUILD_AT_QUICK_EXIT"
build_lib "libatexit.so" 1 "wrap_fptrs.c" "-DBUILD_ATEXIT"
build_lib "libbsearch.so" 1 "wrap_fptrs.c" "-DBUILD_BSEARCH"
build_lib "libqsort.so" 1 "wrap_fptrs.c" "-DBUILD_QSORT"

echo "-- Created lib ${LIBC_NAME}"

exit 0
