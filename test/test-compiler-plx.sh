#!/usr/bin/env bash

LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
NC='\033[0m'

TEST_DIR="tests/compiler/"
TEST_SRCS=()
for i in $(seq 1 20); do
    TEST_SRCS+=("$(basename $(find ${TEST_DIR} -maxdepth 1 -name "${i}_*" -type d))")
done

function file () {
    FILE=${1%.*}
    if [ -f "${FILE}" ]; then rm ${FILE}; fi
    echo "${FILE}"
}

function print_total () {
    echo "----------------------------------------------------------------------"
    if [ ${PASS} -eq ${TOTAL} ]; then
        echo -e "${LIGHT_GREEN}PASS: ${PASS} / ${TOTAL}${NC}"
        PASS=0
    else
        echo -e "${LIGHT_RED}FAIL: ${PASS} / ${TOTAL}${NC}"
        PASS=1
    fi
}

function print_check () {
    echo " ${OPTIM} check ${1} -> [planet: ${RETURN_PASS}]"
}

function print_fail () {
    if [ ${RETURN_PASS} -eq 0 ]; then
        echo -e -n "${TOTAL} ${LIGHT_RED}[n] ${FILE}.plx${NC}"
    else
        echo -e -n "${TOTAL} ${LIGHT_GREEN}[y] ${FILE}.plx${NC}"
    fi
    print_check "fail" "[${PRINT}]"
}

function print_pass () {
    if [ ${RETURN_PASS} -ne 0 ]; then
        echo -e -n "${TOTAL} ${LIGHT_RED}[n] ${FILE}.plx${NC}"
    else
        echo -e -n "${TOTAL} ${LIGHT_GREEN}[y] ${FILE}.plx${NC}"
    fi
    print_check "pass" "[${PRINT}]"
}

function check_fail () {
    if [ ${RETURN_PASS} -ne 0 ]; then
        let PASS+=1
    fi
    print_fail
}

function check_pass () {
    if [ ${RETURN_PASS} -eq 0 ]; then
        ./${FILE}
        RETURN_PASS=${?}
        rm ${FILE}
        if [ ${RETURN_PASS} -eq 0 ]; then
            let PASS+=1
        fi
    fi
    print_pass
}

function check_test () {
    FILE=$(file ${1})

    let TOTAL+=1
    planet ${OPTIM} -E ${FILE}.plx > /dev/null 2>&1
    RETURN_PASS=${?}

    if [[ "${FILE}" == *"invalid"* ]]; then
        check_fail
    else
        check_pass
    fi
}

function test_src () {
    SRC=${1}
    for FILE in $(find ${SRC} -name "plx1_*.plx" -type f | sort --uniq); do
        check_test ${FILE}
    done
}

function test_all () {
    for SRC in ${TEST_SRCS[@]}; do
        test_src ${SRC}
    done
}

PASS=0
TOTAL=0
if [ ! -z "${TOTAL_CC}" ]; then
    PASS=${TOTAL_CC}
    TOTAL=${TOTAL_CC}
    echo ""
fi

ARG=${1}

OPTIM="-O0"
if [ "${1}" = "-O0" ]; then
    ARG=${2}
elif [ "${1}" = "-O1" ]; then
    OPTIM="-O0 -O1"
    ARG=${2}
elif [ "${1}" = "-O2" ]; then
    OPTIM="-O0 -O2"
    ARG=${2}
elif [ "${1}" = "-O3" ]; then
    OPTIM="-O3"
    ARG=${2}
fi

cd ${TEST_DIR}
if [ ! -z "${ARG}" ]; then
    test_src ${TEST_SRCS["$((${ARG} - 1))"]}
else
    test_all
fi
print_total

exit ${PASS}
