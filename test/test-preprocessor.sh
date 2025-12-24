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

function check_success () {
    let TOTAL+=1

    STDOUT=""
    if [ ${RETURN} -ne 0 ]; then
        RESULT="${LIGHT_RED}[n]"
    else
        STDOUT=$(${FILE} ${@})
        RETURN=${?}
        rm ${FILE}
        
        if [ ${RETURN} -eq ${N} ]; then
            if [[ "${STDOUT}" == "${STR}" ]]; then
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

function check_hallo_welt () {
    cd ${TEST_SRC}/hallo_welt
    FILE=$(file ${PWD}/haupt.plx)

    STR="Hallo Welt!"
    for i in $(seq 0 1); do
        planet -E -Ibibliothek/ -Ibibliothek/schnittstelle/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        if [ ${i} -eq 0 ]; then
            N=0; check_success
        else
            N=42; check_success 42
        fi

        planet -E -DProgrammierschnittstelle \
            -DStandardEA=stdio -DStandardBib=stdlib \
            -DGanz=i32 -DZeichenkette=string -Dnichtig=nil \
            -Dbenutze=use -Doffentlich=pub -DFunktion=fn -Dwenn=if -Dzuruck=return \
            -Ibibliothek/ -Ibibliothek/schnittstelle/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        if [ ${i} -eq 0 ]; then
            N=0; check_success
        else
            N=42; check_success 42
        fi
    done
}

function check_hello_lang () {
    cd ${TEST_SRC}/hello_lang
    FILE=$(file ${PWD}/hello.plx)

    for i in $(seq 0 1); do
        if [ ${i} -eq 0 ]; then
            N=0
            DRET_VAL="-DRET_VAL=0"
        else
            N=42
            DRET_VAL=""
        fi

        STR="Hello java!"
        planet -E -DJAVA_LANG ${DRET_VAL} -Iliblang/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        check_success

        STR="Hello python!"
        planet -E -DPYTHON_LANG ${DRET_VAL} -Iliblang/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        check_success

        STR="Hello rust!"
        planet -E -DRUST_LANG ${DRET_VAL} -Iliblang/ ${FILE}.plx > /dev/null 2>&1
        RETURN=${?}
        check_success
    done
}

function check_compiler_tests () {
    TEST_SRC="$(readlink -f ${TEST_DIR}/../compiler)"
    RETURN=0
    STDOUT=""
    N=0; N_i=0; N_s=0
    for FILE in $(find ${TEST_SRC} -name "*.plx" -type f | grep --invert-match invalid | sort --uniq); do
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
            let N_i+=1
            rm "${FILE}.i"
        else
            RETURN=2
        fi
        if [ -f "${FILE}.s" ]; then
            let N_s+=1
            rm "${FILE}.s"
        else
            RETURN=3
        fi
        if [ ${RETURN} -eq 0 ]; then
            let N+=1
        fi
    done

    RETURN=$(find ${TEST_SRC} -name "*.plx" -type f | grep --invert-match invalid | sort --uniq | wc -l)
    STR="${RETURN}/${RETURN}"

    TEST_SRC="${TEST_DIR}/macros_with_m4"
    FILE=$(file ${TEST_SRC}/check_i.plx)
    echo "use \"stdio\"" > ${FILE}.plx
    echo "pub fn main(none) i32 {" >> ${FILE}.plx
    echo "    print(\"${N_i}/${RETURN}\")" >> ${FILE}.plx
    echo "    if ${N_i} == ${RETURN} and ${N} == ${RETURN} {" >> ${FILE}.plx
    echo "        return 0" >> ${FILE}.plx
    echo "    }" >> ${FILE}.plx
    echo "    return 1" >> ${FILE}.plx
    echo "}" >> ${FILE}.plx

    FILE=$(file ${TEST_SRC}/check_s.plx)
    echo "use \"stdio\"" > ${FILE}.plx
    echo "pub fn main(none) i32 {" >> ${FILE}.plx
    echo "    print(\"${N_s}/${RETURN}\")" >> ${FILE}.plx
    echo "    if ${N_s} == ${RETURN} and ${N} == ${RETURN} {" >> ${FILE}.plx
    echo "        return 0" >> ${FILE}.plx
    echo "    }" >> ${FILE}.plx
    echo "    return 1" >> ${FILE}.plx
    echo "}" >> ${FILE}.plx

    FILE=$(file ${TEST_SRC}/check_i.plx)
    planet ${FILE}.plx > /dev/null 2>&1
    RETURN=${?}
    N=0; check_success

    FILE=$(file ${TEST_SRC}/check_s.plx)
    planet ${FILE}.plx > /dev/null 2>&1
    RETURN=${?}
    N=0; check_success
}

function check_macros_with_m4 () {
    TEST_SRC="${TEST_DIR}/macros_with_m4"
    check_hallo_welt
    check_hello_lang
    check_compiler_tests
}

function get_hdir () {
    HEADER_DIR=""
    for i in $(seq 1 ${1}); do
        HEADER_DIR="${HEADER_DIR}${i}/"
    done
    mkdir -p ${TEST_SRC}/${HEADER_DIR}
    echo "${HEADER_DIR}"
}

function check_includes () {
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
    let TOTAL+=1

    echo "e1: i32 = \$(0, 1, 2)" >> ${TEST_SRC}/$(get_hdir ${ERR})test-header_${ERR}.etc

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
        RETURN=0
        STDOUT="File ${FILE}.i not found"
        rm ${FILE}
        RESULT="${LIGHT_RED}[n]"
    else
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

    echo "m4_define(\`DEF_STR', \`s\$1 = \"Hello \$1!\n\"')" > ${TEST_SRC}/test-define_0.plx.m4
    echo -n "" > ${TEST_SRC}/test-header_0.etc

    for i in $(seq 1 $((N-1))); do
        echo "m4_define(\`STR_${i}', \`DEF_STR(${i})')" > ${TEST_SRC}/$(get_hdir ${i})test-define_${i}.plx.m4
        echo "x${i}: i32 = 1" > ${TEST_SRC}/$(get_hdir ${i})test-header_${i}.etc
        echo "# a single-line comment ${i}" >> ${TEST_SRC}/$(get_hdir ${i})test-header_${i}.etc
        echo "use \"stdio\"" >> ${TEST_SRC}/$(get_hdir ${i})test-header_${i}.etc
        echo "import \"$(get_hdir $((${N}-${i})))test-header_$((${N}-${i}))\"" >> ${TEST_SRC}/$(get_hdir ${i})test-header_${i}.etc
        echo "# a multi-line" >> ${TEST_SRC}/$(get_hdir ${i})test-header_${i}.etc
        echo "# comment ${i}" >> ${TEST_SRC}/$(get_hdir ${i})test-header_${i}.etc
        echo "s${i}: string = nil" >> ${TEST_SRC}/$(get_hdir ${i})test-header_${i}.etc
    done

    echo "m4_include(\`test-define_0.plx.m4')" > ${TEST_SRC}/test-define_${N}.plx.m4
    echo "m4_define(\`STR_${N}', \`DEF_STR(${N})')" >> ${TEST_SRC}/test-define_${N}.plx.m4
    echo "x${N}: i32 = 1" > ${TEST_SRC}/test-header_${N}.etc
    echo "# a single-line comment ${N}" >> ${TEST_SRC}/test-header_${N}.etc
    echo "use \"stdio\"" >> ${TEST_SRC}/test-header_${N}.etc
    echo "import \"test-header_0\"" >> ${TEST_SRC}/test-header_${N}.etc
    echo "# a multi-line" >> ${TEST_SRC}/test-header_${N}.etc
    echo "# comment ${N}" >> ${TEST_SRC}/test-header_${N}.etc
    echo "s${N}: string = nil" >> ${TEST_SRC}/test-header_${N}.etc

    echo "use \"stdio\"" >> ${FILE}.plx
    echo "" >> ${FILE}.plx
    echo "x$((${N}+1)): i32 = 1" >> ${FILE}.plx
    echo "# a single-line comment $((${N}+1))" >> ${FILE}.plx
    echo "" >> ${FILE}.plx
    echo "m4_define(\`STR_$((${N}+1))', \`DEF_STR($((${N}+1)))')" >> ${FILE}.plx
    echo "m4_include(\`test-define_${N}.plx.m4')" >> ${FILE}.plx
    for i in $(seq 1 $((N-1))); do
        echo "m4_include(\`$(get_hdir ${i})test-define_${i}.plx.m4')" >> ${FILE}.plx
        echo "import \"$(get_hdir ${i})test-header_${i}\"" >> ${FILE}.plx
    done
    echo "import \"test-header_${N}\"" >> ${FILE}.plx
    echo "" >> ${FILE}.plx
    echo "# a multi-line" >> ${FILE}.plx
    echo "# comment $((${N}+1))" >> ${FILE}.plx
    echo "s$((${N}+1)): string = nil" >> ${FILE}.plx
    echo "" >> ${FILE}.plx
    echo "pub fn main(none) i32 {" >> ${FILE}.plx
    for i in $(seq 1 $((${N}+1))); do
        echo "    s${i} = STR_${i}" >> ${FILE}.plx
    done
    k=1
    for i in $(seq 1 10); do
        echo -n "    print(fmt${i}(" >> ${FILE}.plx
        for j in $(seq 1 $((${i}-1))); do
            echo -n "s${k}, " >> ${FILE}.plx
            k=$((${k}+1))
        done
        echo "s${k}))" >> ${FILE}.plx
        k=$((${k}+1))
    done
    for i in $(seq ${k} $((${N}+1))); do
        echo "    print(s${i})" >> ${FILE}.plx
    done
        echo "    return (0" >> ${FILE}.plx;
    for i in $(seq 1 $((${N}+1))); do
        echo "    + x${i}" >> ${FILE}.plx
    done
    echo "    )" >> ${FILE}.plx
    echo "}" >> ${FILE}.plx

    check_includes
    check_error
}

PASS=0
TOTAL=0
RETURN=0
check_macros_with_m4
check_preprocessor
total

exit ${RETURN}
