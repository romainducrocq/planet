#!/bin/bash

LIGHT_RED='\033[1;31m'
LIGHT_GREEN='\033[1;32m'
NC='\033[0m'

TEST_DIR="${PWD}/tests/preprocessor"

function file () {
    FILE=${1%.*}
    if [ -f "${FILE}" ]; then rm ${FILE}; fi
    echo "${FILE}"
}

function total () {
    echo "----------------------------------------------------------------------"
    RESULT="${PASS} / ${TOTAL}"
    if [ ${PASS} -eq ${TOTAL} ]; then
        RESULT="${LIGHT_GREEN}PASS: ${RESULT}${NC}"
        RETURN=0
    else
        RESULT="${LIGHT_RED}FAIL: ${RESULT}${NC}"
        RETURN=1
    fi
    echo -e "${RESULT}"
}

function indent () {
    echo -n "$(echo "${TOTAL} [ ] ${FILE}.plx" | sed -r 's/./ /g')"
}

function print_check () {
    echo " - check ${1} -> ${2}"
}

function print_success () {
    echo -e -n "${TOTAL} ${RESULT} ${FILE}.plx${NC}"
    PRINT="planet: ${RETURN}"
    print_check "return" "[${PRINT}]"
    if [ ! -z "${STDOUT}" ]; then
        indent
        PRINT=$(echo "planet:"; echo ${STDOUT})
        print_check "stdout" "[${PRINT}]"
    fi
}

function print_error () {
    echo -e -n "${TOTAL} ${RESULT} ${FILE}.plx${NC}"
    PRINT=$(echo "planet:"; echo "${STDOUT}")
    print_check "error" "[${PRINT}]"
}

function check_result () {
    if [ ${RETURN} -eq ${CHECK_VAL} ]; then
        if [[ "${STDOUT}" == "${CHECK_STR}" ]]; then
            RESULT="${LIGHT_GREEN}[y]"
            let PASS+=1
        else
            RESULT="${LIGHT_RED}[n]"
        fi
    else
        RESULT="${LIGHT_RED}[n]"
    fi
}

function check_success () {
    let TOTAL+=1

    STDOUT=""
    if [ ${RETURN} -ne 0 ]; then
        RESULT="${LIGHT_RED}[n]"
    else
        STDOUT=$(${FILE} ${@} 2>&1)
        RETURN=${?}
        rm ${FILE}

        check_result
    fi

    print_success
}

function check_libc_bindings () {
    cd ${TEST_SRC}/libc_bindings
    FILE=$(file ${PWD}/.plx)

}

function check_hallo_welt () {
    cd ${TEST_SRC}/hallo_welt
    FILE=$(file ${PWD}/haupt.plx)

    CHECK_STR="Hallo Welt!"
    for i in $(seq 0 1); do
        planet -E -Ibibliothek/ -Ibibliothek/schnittstelle/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        if [ ${i} -eq 0 ]; then
            CHECK_VAL=0; check_success
        else
            CHECK_VAL=42; check_success 42
        fi

        planet -E -DProgrammierschnittstelle \
            -DStandardEA=stdio -DStandardBib=stdlib \
            -DGanz=i32 -DZeichenkette=string -Dnichtig=nil \
            -Dbenutze=use -Doffentlich=pub -DFunktion=fn -Dwenn=if -Dzuruck=return \
            -Ibibliothek/ -Ibibliothek/schnittstelle/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        if [ ${i} -eq 0 ]; then
            CHECK_VAL=0; check_success
        else
            CHECK_VAL=42; check_success 42
        fi
    done
}

function check_hello_lang () {
    cd ${TEST_SRC}/hello_lang
    FILE=$(file ${PWD}/hello.plx)

    for i in $(seq 0 1); do
        if [ ${i} -eq 0 ]; then
            CHECK_VAL=0
            DRET_VAL="-DRET_VAL=0"
        else
            CHECK_VAL=42
            DRET_VAL=""
        fi

        CHECK_STR="Hello java!"
        planet -E -DJAVA_LANG ${DRET_VAL} -Iliblang/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        check_success

        CHECK_STR="Hello python!"
        planet -E -DPYTHON_LANG ${DRET_VAL} -Iliblang/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        check_success

        CHECK_STR="Hello rust!"
        planet -E -DRUST_LANG ${DRET_VAL} -Iliblang/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        check_success
    done
}

function check_compiler_tests () {
    RETURN=0
    STDOUT=""

    COUNT_I=0; COUNT_S=0; CHECK_VAL=0
    FILES="$(find $(readlink -f ${TEST_DIR}/../compiler) -name "*.plx" -type f |\
         grep --invert-match invalid | sort --uniq)"
    for FILE in ${FILES}; do
        FILE=$(file ${FILE})
        if [ -f "${FILE}.i" ]; then
            rm "${FILE}.i"
        fi
        if [ -f "${FILE}.s" ]; then
            rm "${FILE}.s"
        fi
        planet -E -S ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        if [ ${RETURN} -ne 0 ]; then
            RETURN=1
        fi
        if [ -f "${FILE}.i" ]; then
            let COUNT_I+=1
            rm "${FILE}.i"
        else
            RETURN=2
        fi
        if [ -f "${FILE}.s" ]; then
            let COUNT_S+=1
            rm "${FILE}.s"
        else
            RETURN=3
        fi
        if [ ${RETURN} -eq 0 ]; then
            let CHECK_VAL+=1
        fi
    done

    RETURN=$(echo "${FILES}" | wc -l)
    CHECK_STR="${RETURN}/${RETURN}"

    OUT_FILE="${TEST_SRC}/check_i.plx"
    echo "use \"stdio\"" > ${OUT_FILE}
    echo "pub fn main(none) i32 {" >> ${OUT_FILE}
    echo "    print(\"${COUNT_I}/${RETURN}\")" >> ${OUT_FILE}
    echo "    if ${COUNT_I} == ${RETURN} and ${CHECK_VAL} == ${RETURN} {" >> ${OUT_FILE}
    echo "        return 0" >> ${OUT_FILE}
    echo "    }" >> ${OUT_FILE}
    echo "    return 1" >> ${OUT_FILE}
    echo "}" >> ${OUT_FILE}

    OUT_FILE="${TEST_SRC}/check_s.plx"
    echo "use \"stdio\"" > ${OUT_FILE}
    echo "pub fn main(none) i32 {" >> ${OUT_FILE}
    echo "    print(\"${COUNT_S}/${RETURN}\")" >> ${OUT_FILE}
    echo "    if ${COUNT_S} == ${RETURN} and ${CHECK_VAL} == ${RETURN} {" >> ${OUT_FILE}
    echo "        return 0" >> ${OUT_FILE}
    echo "    }" >> ${OUT_FILE}
    echo "    return 1" >> ${OUT_FILE}
    echo "}" >> ${OUT_FILE}

    FILE=$(file ${TEST_SRC}/check_i.plx)
    planet ${FILE}.plx > /dev/null 2>&1
    RETURN=${?}
    CHECK_VAL=0; check_success

    FILE=$(file ${TEST_SRC}/check_s.plx)
    planet ${FILE}.plx > /dev/null 2>&1
    RETURN=${?}
    CHECK_VAL=0; check_success
}

function check_macros_with_m4 () {
    TEST_SRC="${TEST_DIR}/macros_with_m4"
    check_hallo_welt
    check_hello_lang
    check_compiler_tests
}

function get_header_dir () {
    HEADER_DIR=""
    for i in $(seq 1 ${1}); do
        HEADER_DIR="${HEADER_DIR}${i}/"
    done
    mkdir -p ${TEST_SRC}/${HEADER_DIR}
    echo "${HEADER_DIR}"
}

function check_includes () {
    N=${1}
    let TOTAL+=1

    planet -E -I${TEST_SRC} ${FILE}.plx > /dev/null 2>&1
    RETURN=${?}
    STDOUT=""
    if [ ${RETURN} -ne 0 ]; then
        RESULT="${LIGHT_RED}[n]"
    else
        STDOUT=$(${FILE})
        RETURN=${?}
        rm ${FILE}

        diff -sq <(echo "${STDOUT}") <(
            for i in $(seq 1 $((${N}+1))); do
                echo "Hello ${i}!"
            done
        ) | grep -q "identical"
        if [ ${?} -eq 0 ]; then
            if [ ${RETURN} -eq $((${N}+1)) ]; then
                RESULT="${LIGHT_GREEN}[y]"
                let PASS+=1
            else
                RESULT="${LIGHT_RED}[n]"
            fi
        else
            RESULT="${LIGHT_RED}[n]"
        fi
    fi

    print_success
}

function check_error () {
    ERR=${1}
    let TOTAL+=1

    OUT_FILE="${TEST_SRC}/$(get_header_dir ${ERR})test-header_${ERR}.etc"
    echo "e1: i32 = \$(0, 1, 2)" >> ${OUT_FILE}

    if [ -f "${FILE}" ]; then
        rm ${FILE}
    fi
    if [ -f "${FILE}.i" ]; then
        rm ${FILE}.i
    fi

    STDOUT=$(planet -E -I${TEST_SRC} ${FILE}.plx 2>&1)
    RETURN=${?}
    if [ ${RETURN} -eq 0 ]; then
        rm ${FILE}
        RESULT="${LIGHT_RED}[n]"
    elif [ ! -f "${FILE}.i" ]; then
        RETURN=1
        STDOUT="File ${FILE}.i not found"
        RESULT="${LIGHT_RED}[n]"
    else
        rm ${FILE}.i
        diff -sq <(echo "${STDOUT}") <(
            echo -e -n "\033[1m${TEST_SRC}/"
            for i in $(seq 1 $((${ERR}))); do
                echo -n "${i}/"
            done
            echo -e "test-header_${ERR}.etc:8:13:${NC}"
            echo -e "\033[0;31merror:${NC} (no. 547) cannot initialize scalar type \033[1m‘i32’${NC} with compound initializer"
            echo -e "at line 8: \033[0;31m            v${NC}"
            echo -e "         | \033[1me1: i32 = \$(0, 1, 2)${NC}"
            echo -e "planet: \033[0;31merror:${NC} compilation failed, see \033[1m‘--help’${NC}"
        ) | grep -q "identical"
        if [ ${?} -eq 0 ]; then
            RESULT="${LIGHT_GREEN}[y]"
            let PASS+=1
        else
            RESULT="${LIGHT_RED}[n]"
        fi
    fi

    print_error
}

function check_preprocessor () {
    cd ${TEST_DIR}
    TEST_SRC="${TEST_DIR}/preprocessor"
    FILE=$(file ${TEST_SRC}/main.plx)

    N=63
    ERR=27

    if [ -d "${TEST_SRC}" ]; then
        rm -r ${TEST_SRC}
    fi
    mkdir -p ${TEST_SRC}

    echo -n "" > ${TEST_SRC}/test-header_0.etc

    OUT_FILE="${TEST_SRC}/test-define_0.plx.m4"
    echo "m4_define(\`DEF_STR', \`s\$1 = \"Hello \$1!\n\"')" > ${OUT_FILE}

    for i in $(seq 1 $((N-1))); do
        OUT_FILE="${TEST_SRC}/$(get_header_dir ${i})test-header_${i}.etc"
        echo "x${i}: i32 = 1" > ${OUT_FILE}
        echo "# a single-line comment ${i}" >> ${OUT_FILE}
        echo "use \"stdio\"" >> ${OUT_FILE}
        echo "import \"$(get_header_dir $((${N}-${i})))test-header_$((${N}-${i}))\"" >> ${OUT_FILE}
        echo "# a multi-line" >> ${OUT_FILE}
        echo "# comment ${i}" >> ${OUT_FILE}
        echo "s${i}: string = nil" >> ${OUT_FILE}

        OUT_FILE="${TEST_SRC}/$(get_header_dir ${i})test-define_${i}.plx.m4"
        echo "m4_define(\`STR_${i}', \`DEF_STR(${i})')" > ${OUT_FILE}
    done

    OUT_FILE="${TEST_SRC}/test-header_${N}.etc"
    echo "x${N}: i32 = 1" > ${OUT_FILE}
    echo "# a single-line comment ${N}" >> ${OUT_FILE}
    echo "use \"stdio\"" >> ${OUT_FILE}
    echo "import \"test-header_0\"" >> ${OUT_FILE}
    echo "# a multi-line" >> ${OUT_FILE}
    echo "# comment ${N}" >> ${OUT_FILE}
    echo "s${N}: string = nil" >> ${OUT_FILE}

    OUT_FILE="${TEST_SRC}/test-define_${N}.plx.m4"
    echo "m4_include(\`test-define_0.plx.m4')" > ${OUT_FILE}
    echo "m4_define(\`STR_${N}', \`DEF_STR(${N})')" >> ${OUT_FILE}

    OUT_FILE="${FILE}.plx"
    echo "use \"stdio\"" >> ${OUT_FILE}
    echo "" >> ${OUT_FILE}
    echo "x$((${N}+1)): i32 = 1" >> ${OUT_FILE}
    echo "# a single-line comment $((${N}+1))" >> ${OUT_FILE}
    echo "" >> ${OUT_FILE}
    echo "m4_define(\`STR_$((${N}+1))', \`DEF_STR($((${N}+1)))')" >> ${OUT_FILE}
    echo "m4_include(\`test-define_${N}.plx.m4')" >> ${OUT_FILE}
    for i in $(seq 1 $((N-1))); do
        echo "m4_include(\`$(get_header_dir ${i})test-define_${i}.plx.m4')" >> ${OUT_FILE}
        echo "import \"$(get_header_dir ${i})test-header_${i}\"" >> ${OUT_FILE}
    done
    echo "import \"test-header_${N}\"" >> ${OUT_FILE}
    echo "" >> ${OUT_FILE}
    echo "# a multi-line" >> ${OUT_FILE}
    echo "# comment $((${N}+1))" >> ${OUT_FILE}
    echo "s$((${N}+1)): string = nil" >> ${OUT_FILE}
    echo "" >> ${OUT_FILE}
    echo "pub fn main(none) i32 {" >> ${OUT_FILE}
    for i in $(seq 1 $((${N}+1))); do
        echo "    s${i} = STR_${i}" >> ${OUT_FILE}
    done
    k=1
    for i in $(seq 1 10); do
        echo -n "    print(fmt${i}(" >> ${OUT_FILE}
        for j in $(seq 1 $((${i}-1))); do
            echo -n "s${k}, " >> ${OUT_FILE}
            k=$((${k}+1))
        done
        echo "s${k}))" >> ${OUT_FILE}
        k=$((${k}+1))
    done
    for i in $(seq ${k} $((${N}+1))); do
        echo "    print(s${i})" >> ${OUT_FILE}
    done
        echo "    return (0" >> ${OUT_FILE};
    for i in $(seq 1 $((${N}+1))); do
        echo "    + x${i}" >> ${OUT_FILE}
    done
    echo "    )" >> ${OUT_FILE}
    echo "}" >> ${OUT_FILE}

    check_includes ${N}
    check_error ${ERR}
}

PASS=0
TOTAL=0
RETURN=0
check_libc_bindings
check_macros_with_m4
check_preprocessor
total

exit ${RETURN}
