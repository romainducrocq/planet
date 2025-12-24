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

function check_macros_with_m4 () {
    TEST_SRC="${TEST_DIR}/macros_with_m4"
    check_hallo_welt
    check_hello_lang
}

function header_dir () {
    HEADER_DIR=""
    for i in $(seq 1 ${1}); do
        HEADER_DIR="${HEADER_DIR}${i}/"
    done
    mkdir -p ${TEST_SRC}/${HEADER_DIR}
    echo "${HEADER_DIR}"
}

function make_test () {
    if [ -d "${TEST_SRC}" ]; then
        rm -r ${TEST_SRC}
    fi
    mkdir -p ${TEST_SRC}

    for i in $(seq 1 $((N-1))); do
        echo "int x${i} = 1;" > ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
        echo "// a single-line comment ${i}" >> ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
        echo "#pragma pragma${i}" >> ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
        echo "#include \"$(header_dir $((${N}-${i})))test-header_$((${N}-${i})).etc\"" >> ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
        echo "/* a multi-line" >> ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
        echo "comment ${i}" >> ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
        echo "   */" >> ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
        echo "#define MACRO_${i} ${i}" >> ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
        echo "char* s${i} = \"Hello ${i}!\";" >> ${TEST_SRC}/$(header_dir ${i})test-header_${i}.etc
    done

    echo "int x${N} = 1;" > ${TEST_SRC}/test-header_${N}.etc
    echo "// a single-line comment ${N}" >> ${TEST_SRC}/test-header_${N}.etc
    echo "#pragma pragma${N}" >> ${TEST_SRC}/test-header_${N}.etc
    echo "#include \"test-header_0.etc\"" >> ${TEST_SRC}/test-header_${N}.etc
    echo "/* a multi-line" >> ${TEST_SRC}/test-header_${N}.etc
    echo "comment ${N}" >> ${TEST_SRC}/test-header_${N}.etc
    echo "   */" >> ${TEST_SRC}/test-header_${N}.etc
    echo "#define MACRO_${N} ${N}" >> ${TEST_SRC}/test-header_${N}.etc
    echo "char* s${N} = \"Hello ${N}!\";" >> ${TEST_SRC}/test-header_${N}.etc

    echo -n "" > ${TEST_SRC}/test-header_0.etc

    echo "int puts(char* s);" > ${FILE}.plx
    echo "" >> ${FILE}.plx
    echo "int x$((${N}+1)) = 1;" >> ${FILE}.plx
    echo "// a single-line comment $((${N}+1))" >> ${FILE}.plx
    echo "#pragma pragma$((${N}+1))" >> ${FILE}.plx
    echo "" >> ${FILE}.plx
    for i in $(seq 1 $((N-1))); do
        echo "#include \"$(header_dir ${i})test-header_${i}.etc\"" >> ${FILE}.plx
    done
    echo "#include \"test-header_${N}.etc\"" >> ${FILE}.plx
    echo "" >> ${FILE}.plx
    echo "/* a multi-line" >> ${FILE}.plx
    echo "comment $((${N}+1))" >> ${FILE}.plx
    echo "   */" >> ${FILE}.plx
    echo "#define MACRO_$((${N}+1)) $((${N}+1))" >> ${FILE}.plx
    echo "char* s$((${N}+1)) = \"Hello $((${N}+1))!\";" >> ${FILE}.plx
    echo "" >> ${FILE}.plx
    echo "int main(void) {" >> ${FILE}.plx
    for i in $(seq 1 $((${N}+1))); do
        echo "    puts(s${i});" >> ${FILE}.plx
    done
        echo "    return 0" >> ${FILE}.plx;
    for i in $(seq 1 $((${N}+1))); do
        echo "    + x${i}" >> ${FILE}.plx
    done
    echo "    ;" >> ${FILE}.plx
    echo "}" >> ${FILE}.plx
}

function check_includes () {
    let TOTAL+=1

    planet ${FILE}.plx > /dev/null 2>&1
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

# function check_error () {
#     let TOTAL+=1

#     echo "int e1 = {0, 1, 2};" >> ${TEST_SRC}/$(header_dir ${ERR})test-header_${ERR}.h

#     if [ -f "${FILE}" ]; then
#         rm ${FILE}
#     fi

#     STDOUT=$(planet ${FILE}.c 2>&1)
#     RETURN=${?}
#     if [ ${RETURN} -eq 0 ]; then
#         rm ${FILE}
#         RESULT="${LIGHT_RED}[n]"
#     else
#         diff -sq <(echo "${STDOUT}") <(
#             echo -e -n "\033[1m${TEST_SRC}/"
#             for i in $(seq 1 $((${ERR}))); do
#                 echo -n "${i}/"
#             done
#             echo -e "test-header_${ERR}.h:10:11:${NC}"
#             echo -e "\033[0;31merror:${NC} (no. 547) cannot initialize scalar type \033[1m‘int’${NC} with compound initializer"
#             echo -e "at line 10: \033[0;31m          v${NC}"
#             echo -e "          | \033[1mint e1 = {0, 1, 2};${NC}"
#             echo -e "planet: \033[0;31merror:${NC} compilation failed, see \033[1m‘--help’${NC}"
#         ) | grep -q "identical"
#         if [ ${?} -eq 0 ]; then
#             RESULT="${LIGHT_GREEN}[y]"
#             let PASS+=1
#         else
#             RESULT="${LIGHT_RED}[n]"
#         fi
#     fi

#     print_error
# }

function check_preprocessor () {
    TEST_SRC="${TEST_DIR}/preprocessor"

    cd ${TEST_SRC}
    FILE=$(file ${PWD}/main.plx)

    N=63
    ERR=27

    make_test

    # check_includes
    # check_error
}

PASS=0
TOTAL=0
RETURN=0
check_macros_with_m4
check_preprocessor
total

exit ${RETURN}
