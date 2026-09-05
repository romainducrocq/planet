#!/usr/bin/env bash

# TODO review this file
KERNEL_NAME="$(uname -s)"
PACKAGE_DIR="$(readlink -f ../wheelcc/bin)"
PACKAGE_NAME="$(cat ${PACKAGE_DIR}/pkgname.cfg)"
LD="gcc"
if [[ "${KERNEL_NAME}" == "Darwin"* ]]; then
    LD="clang -arch x86_64"
elif [[ "${KERNEL_NAME}" == "FreeBSD"* ]]; then
    LD="clang"
fi
# TODO rm
CC_FLAGS="-Wall -Wextra -Wpedantic -D__GCC_BOOTSTRAP__"
CC_FLAGS_RELEASE="-O3 -DNDEBUG -Werror -pedantic-errors"
CC_FLAGS="-std=c17 ${CC_FLAGS} ${CC_FLAGS_RELEASE}"

BUILD_DIR="$(dirname ${PACKAGE_DIR})/build"
SELFHOST_DIR="$(readlink -f ../selfhost)"

SOURCE_FILES="${SELFHOST_DIR}/lib/main.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/3rdparty/sds.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/3rdparty/stb_ds.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/ast.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/back_ast.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/back_symt.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/front_ast.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/front_symt.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/interm_ast.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/asm_gen.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/gas_code.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/registers.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/stack_fix.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/symt_cvt.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/errors.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/idents.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/lexer.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/parser.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/semantic.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/tac_repr.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/optimizer/optim_tac.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/optimizer/reg_alloc.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/util/fileio.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/util/str2t.c"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/util/throw.c"

function em() {
    echo "\033[1m‘${1}’\033[0m"
}

function raise_error () {
    ERROR_MESSAGE="${1}"
    echo -e "selfhost: \033[0;31merror:\033[0m ${ERROR_MESSAGE}" 1>&2
    exit 1
}

# TODO check that planet is already built
# function check_setup () {
#     case "${LD}" in
#         "clang"*)
#             CLANG_MAJOR_VERSION=$(clang -dumpversion | cut -d"." -f1)
#             if [ ${CLANG_MAJOR_VERSION} -lt 5 ]; then
#                 raise_error "requires $(em "clang") >= 5.0.0"
#             fi
#             ;;
#         "gcc")
#             GCC_MAJOR_VERSION=$(gcc -dumpversion | cut -d"." -f1)
#             if [ ${GCC_MAJOR_VERSION} -lt 8 ]; then
#                 raise_error "requires $(em "gcc") >= 8.1.0"
#             elif [ ${GCC_MAJOR_VERSION} -eq 8 ]; then
#                 GCC_MINOR_VERSION=$(gcc -dumpfullversion | cut -d"." -f2)
#                 if [ ${GCC_MINOR_VERSION} -eq 0 ]; then
#                     raise_error "requires $(em "gcc") >= 8.1.0"
#                 fi
#             fi
#             ;;
#         *)
#             raise_error "$(em "${LD}") is not a valid linker"
#     esac

#     as --help > /dev/null 2>&1
#     if [ ${?} -ne 0 ]; then
#         raise_error "requires package $(em "binutils")"
#     fi
#     return 0
# }

function build_selfhost () {
    BUILD_CACHE="${BUILD_DIR}/build_cache"
    if [ -d "${BUILD_CACHE}/" ]; then
        rm -r ${BUILD_CACHE}/
        if [ ${?} -ne 0 ]; then return 1; fi
    fi
    mkdir ${BUILD_CACHE}/
    if [ ${?} -ne 0 ]; then return 1; fi

    OBJECT_FILES=""
    echo "-- Build objects ..."
    for FILE in ${SOURCE_FILES}; do
        OBJECT="${BUILD_CACHE}/$(basename ${FILE%.*}).o"
        OBJECT_FILES="${OBJECT_FILES} ${OBJECT}"
        echo "${FILE} -> ${OBJECT}"

        ${LD} -c ${FILE} ${CC_FLAGS} -o ${OBJECT}
        if [ ${?} -ne 0 ]; then return 1; fi

        # "wheelcc")
        #     bash ${WHEELCC_DIR}/bin/driver.sh -O2 -E -c ${FILE}
        #     if [ ${?} -ne 0 ]; then return 1; fi
        #     mv ${FILE%.*}.o ${OBJECT}
        #     if [ ${?} -ne 0 ]; then return 1; fi
        #     ;;

        # ${WACC_LINK} -O2 -E -c ${FILE}
        # if [ ${?} -ne 0 ]; then return 1; fi
        # mv ${FILE%.*}.o ${OBJECT}
        # if [ ${?} -ne 0 ]; then return 1; fi
    done
    echo "OK"

    PROJECT_NAME="${PACKAGE_DIR}/${PACKAGE_NAME}"
    if [ -f "${PROJECT_NAME}" ]; then
        rm ${PROJECT_NAME}
        if [ ${?} -ne 0 ]; then return 1; fi
    fi

    echo "-- Linking executable ..."
    echo "${BUILD_CACHE}/*.o -> ${PROJECT_NAME}"
    # TODO rm CC_FLAGS
    ${LD} ${OBJECT_FILES} ${CC_FLAGS} -o ${PROJECT_NAME}
    if [ ${?} -ne 0 ]; then return 1; fi
    echo "OK"

    echo "-- Created target ${PROJECT_NAME}"
    return 0
}

# check_setup
# if [ ${?} -ne 0 ]; then raise_error "check setup failed"; fi

build_selfhost
if [ ${?} -ne 0 ]; then raise_error "build selfhost failed"; fi

echo "---"
echo -e "[\033[1;32mselfhost\033[0m] build was successful, \
see usage with command $(em "${PACKAGE_NAME} --help")"
echo "---"
exit 0
