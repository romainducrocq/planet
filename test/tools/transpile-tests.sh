#!/bin/bash

TEST_DIR_CC="${PWD}/../../wheelcc/test/tests/compiler"
TEST_DIR="${PWD}/../tests/compiler"
TEST_SRCS=()
for i in $(seq 1 20); do
    TEST_SRCS+=("$(basename $(find ${TEST_DIR} -maxdepth 1 -name "${i}_*" -type d))")
done

function transpile_test () {
    FILE="${1}"
    cp ${FILE}.c ${FILE}.plx
    transpiler-planet ${FILE}.plx > /dev/null 2>&1
    if [ -f "${FILE}.plx.transpile" ]; then
        mv ${FILE}.plx.transpile ${TEST_DIR}/${FILE}.plx
    fi
    rm ${FILE}.plx
}

function transpile_src () {
    SRC=${1}
    for FILE in $(find ${SRC} -name "*.c" -type f | sort --uniq); do
        transpile_test ${FILE%.*}
    done
}

function transpile_all () {
    for SRC in ${TEST_SRCS[@]}; do
        transpile_src ${SRC}
    done
}

ARG=${1}

cd ${TEST_DIR_CC}
if [ ! -z "${ARG}" ]; then
    transpile_src ${TEST_SRCS["$((${ARG} - 1))"]}
else
    : #transpile_all
fi

exit 0
