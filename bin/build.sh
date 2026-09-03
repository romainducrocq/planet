#!/usr/bin/env bash

KERNEL_NAME="$(uname -s)"
PROJECT_DIR="$(dirname $(readlink -f ${0}))"
LD="gcc"
if [[ "${KERNEL_NAME}" == "Darwin"* ]]; then
    LD="clang -arch x86_64"
elif [[ "${KERNEL_NAME}" == "FreeBSD"* ]]; then
    LD="clang"
fi
CC_FLAGS="-Wall -Wextra -Wpedantic -D__GCC_BOOTSTRAP__"
CC_FLAGS_RELEASE="-O3 -DNDEBUG -Werror -pedantic-errors"
CC_FLAGS="-std=c17 ${CC_FLAGS} ${CC_FLAGS_RELEASE}"

ARG1="${1}"
ARG2="${2}"

WACC_NAME="wacc-selfhosted"
WACC_LINK="${PROJECT_DIR}/${WACC_NAME}"

BUILD_DIR="$(dirname ${PROJECT_DIR})/build"
COMPILER_DIR="$(dirname ${PROJECT_DIR})/compiler"
NQCC2_DIR="$(dirname ${PROJECT_DIR})/nqcc2"
WHEELCC_DIR="$(dirname ${PROJECT_DIR})/wheelcc"

SOURCE_FILES="${COMPILER_DIR}/lib/main.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/3rdparty/sds.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/3rdparty/stb_ds.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/ast/ast.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/ast/back_ast.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/ast/back_symt.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/ast/front_ast.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/ast/front_symt.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/ast/interm_ast.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/backend/asm_gen.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/backend/gas_code.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/backend/registers.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/backend/stack_fix.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/backend/symt_cvt.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/frontend/errors.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/frontend/idents.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/frontend/lexer.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/frontend/parser.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/frontend/semantic.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/frontend/tac_repr.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/optimizer/optim_tac.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/optimizer/reg_alloc.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/util/fileio.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/util/str2t.c"
SOURCE_FILES="${SOURCE_FILES} ${COMPILER_DIR}/util/throw.c"

function help () {
   echo "Usage 1: ./build.sh --bootstrap <compiler> [cc_options ...]"
   echo ""
   echo "<compiler>        compiler used for bootstrapping wacc executable"
   echo "[cc_options ...]  optional list of arguments passed to a custom cc"
   echo ""
   echo "Usage 2: ./build.sh <in-compiler> <out-compiler>"
   echo ""
   echo "<in-compiler>     input compiler executable used for rebuilding"
   echo "<out-compiler>    output compiler executable target to build"
   exit 0
}

function em() {
    echo "\033[1m‘${1}’\033[0m"
}

function raise_error () {
    ERROR_MESSAGE="${1}"
    echo -e "build: \033[0;31merror:\033[0m ${ERROR_MESSAGE}, see $(em "--help")" 1>&2
    exit 1
}

function check_setup () {
    case "${LD}" in
        "clang"*)
            CLANG_MAJOR_VERSION=$(clang -dumpversion | cut -d"." -f1)
            if [ ${CLANG_MAJOR_VERSION} -lt 5 ]; then
                raise_error "requires $(em "clang") >= 5.0.0"
            fi
            ;;
        "gcc")
            GCC_MAJOR_VERSION=$(gcc -dumpversion | cut -d"." -f1)
            if [ ${GCC_MAJOR_VERSION} -lt 8 ]; then
                raise_error "requires $(em "gcc") >= 8.1.0"
            elif [ ${GCC_MAJOR_VERSION} -eq 8 ]; then
                GCC_MINOR_VERSION=$(gcc -dumpfullversion | cut -d"." -f2)
                if [ ${GCC_MINOR_VERSION} -eq 0 ]; then
                    raise_error "requires $(em "gcc") >= 8.1.0"
                fi
            fi
            ;;
        *)
            raise_error "$(em "${LD}") is not a valid linker"
    esac

    as --help > /dev/null 2>&1
    if [ ${?} -ne 0 ]; then
        raise_error "requires package $(em "binutils")"
    fi
    return 0
}

function configure () {
    if [ "${ARG1}" = "--bootstrap" ]; then
        case "${ARG2}" in
            "gcc")
                CC_NAME="${LD}"
                ;;
            "nqcc2")
                CC_NAME="nqcc2"
                if [ ! -f "${NQCC2_DIR}/_build/default/bin/main.exe" ]; then
                    cat ${PROJECT_DIR}/build-nqcc2.md
                    raise_error "build $(em "nqcc2") for bootstrapping"
                fi
                ;;
            "wheelcc")
                CC_NAME="wheelcc"
                if [ ! -f "${WHEELCC_DIR}/bin/wheelcc" ]; then
                    bash ${PROJECT_DIR}/build-wheelcc.sh
                    if [ ${?} -ne 0 ]; then exit 1; fi
                    echo "---"
                fi
                ;;
            *)
                CC_NAME="$(basename "${ARG2}")"
                ;;
        esac
        EXEC_NAME="wacc-bootstrap-${CC_NAME// /}"
        EXEC_NAME="${EXEC_NAME%.*}"

        echo "-- Bootstrapping with ${CC_NAME} ..."
    else
        CC_NAME="$(basename "${ARG1}")"
        EXEC_NAME="$(basename "${ARG2}")"
        for IGNORE in $(cat ${PROJECT_DIR}/.ignore); do
            if [ "${EXEC_NAME}" = "${IGNORE}" ]; then
                raise_error "$(em "${EXEC_NAME}") is not a valid executable name"
            fi
        done

        echo "-- Building with ${CC_NAME} ..."
        bash ${PROJECT_DIR}/set-exec.sh ${CC_NAME}
        if [ ${?} -ne 0 ]; then exit 1; fi
    fi
    return 0
}

function build_exec () {
    PROJECT_NAME="${PROJECT_DIR}/${EXEC_NAME}"
    if [ -f "${PROJECT_NAME}" ]; then
        rm ${PROJECT_NAME}
        if [ ${?} -ne 0 ]; then return 1; fi
    fi

    if [ -d "${BUILD_DIR}/" ]; then
        rm -r ${BUILD_DIR}/
        if [ ${?} -ne 0 ]; then return 1; fi
    fi
    mkdir ${BUILD_DIR}/
    if [ ${?} -ne 0 ]; then return 1; fi

    OBJECT_FILES=""
    echo "-- Build objects ..."
    for FILE in ${SOURCE_FILES}; do
        OBJECT="${BUILD_DIR}/$(basename ${FILE%.*}).o"
        OBJECT_FILES="${OBJECT_FILES} ${OBJECT}"
        echo "(${CC_NAME}) ${FILE} -> ${OBJECT}"

        if [ "${ARG1}" = "--bootstrap" ]; then
            case "${ARG2}" in
                "gcc")
                    ${LD} -c ${FILE} ${CC_FLAGS} -o ${OBJECT}
                    if [ ${?} -ne 0 ]; then return 1; fi
                    ;;
                "nqcc2")
                    ${NQCC2_DIR}/_build/default/bin/main.exe -c ${FILE} \
                        --bitwise --compound --increment --goto --switch --nan --union
                    if [ ${?} -ne 0 ]; then return 1; fi
                    mv ${FILE%.*}.o ${OBJECT}
                    if [ ${?} -ne 0 ]; then return 1; fi
                    ;;
                "wheelcc")
                    bash ${WHEELCC_DIR}/bin/driver.sh -O2 -E -c ${FILE}
                    if [ ${?} -ne 0 ]; then return 1; fi
                    mv ${FILE%.*}.o ${OBJECT}
                    if [ ${?} -ne 0 ]; then return 1; fi
                    ;;
                *)
                    $(readlink -f "${ARG2}") -c ${FILE} ${@}
                    if [ ${?} -ne 0 ]; then return 1; fi
                    mv ${FILE%.*}.o ${OBJECT}
                    if [ ${?} -ne 0 ]; then return 1; fi
                    ;;
            esac
        else
            ${WACC_LINK} -O2 -E -c ${FILE}
            if [ ${?} -ne 0 ]; then return 1; fi
            mv ${FILE%.*}.o ${OBJECT}
            if [ ${?} -ne 0 ]; then return 1; fi
        fi
    done
    echo "OK"

    echo "-- Linking executable ..."
    echo "${BUILD_DIR}/*.o -> ${PROJECT_NAME}"
    ${LD} ${OBJECT_FILES} ${CC_FLAGS} -o ${PROJECT_NAME}
    if [ ${?} -ne 0 ]; then return 1; fi
    echo "OK"

    bash ${PROJECT_DIR}/set-exec.sh ${EXEC_NAME}
    if [ ${?} -ne 0 ]; then exit 1; fi

    echo "-- Created target ${PROJECT_NAME}"

    find ${PROJECT_DIR}/ -maxdepth 1 -name ${WACC_NAME} -type l -delete
    if [ ${?} -ne 0 ]; then return 1; fi

    ln -s ${PROJECT_DIR}/driver.sh ${WACC_LINK}
    if [ ${?} -ne 0 ]; then return 1; fi

    echo -e "-- Created symlink \033[1;36m${WACC_LINK}\033[0m -> \
\033[1;32m${PROJECT_DIR}/driver.sh\033[0m"
    return 0
}

if [ "${1}" = "--help" ]; then
    help
elif [ ${#} -lt 2 ]; then
    help
fi

CC_NAME=""
EXEC_NAME=""

check_setup
if [ ${?} -ne 0 ]; then raise_error "check setup failed"; fi

configure
if [ ${?} -ne 0 ]; then raise_error "configure failed"; fi

build_exec ${@:3}
if [ ${?} -ne 0 ]; then raise_error "build executable failed"; fi

echo "---"
echo -e "[\033[1;32m${EXEC_NAME}\033[0m] build was successful, \
see usage with command $(em "./${WACC_NAME} --help")"
echo "---"
exit 0
