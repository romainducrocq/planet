#!/usr/bin/env bash

# TODO review this file
KERNEL_NAME="$(uname -s)"
PACKAGE_DIR="$(readlink -f ../wheelcc/bin)"
PACKAGE_LIBC="${PACKAGE_DIR}/libc"
OS_MACRO="__linux__"
if [[ "${KERNEL_NAME}" == "Darwin"* ]]; then
    OS_MACRO="__APPLE__"
elif [[ "${KERNEL_NAME}" == "FreeBSD"* ]]; then
    OS_MACRO="__FreeBSD__"
fi

PROJECT_NAME="${PACKAGE_DIR}/planet"
SELFHOST_DIR="$(readlink -f ../selfhost)"

SOURCE_FILES="${SELFHOST_DIR}/main.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/ast.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/back_ast.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/back_symt.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/front_ast.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/front_symt.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/ast/interm_ast.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/asm_gen.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/gas_code.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/registers.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/stack_fix.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/backend/symt_cvt.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/errors.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/idents.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/lexer.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/parser.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/semantic.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/frontend/tac_repr.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/optimizer/optim_tac.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/optimizer/reg_alloc.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/util/fileio.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/util/str2t.plx"
SOURCE_FILES="${SOURCE_FILES} ${SELFHOST_DIR}/util/throw.plx"

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
    echo "-- Build executable ..."
    planet -v -O2 -E -D${OS_MACRO} -I${SELFHOST_DIR}/ \
        -o ${PROJECT_NAME} ${SOURCE_FILES}
    if [ ${?} -ne 0 ]; then return 1; fi
    echo "OK"
    echo "-- Created target ${PROJECT_NAME}"
    return 0
}

# check_setup
# if [ ${?} -ne 0 ]; then raise_error "check setup failed"; fi

build_selfhost
if [ ${?} -ne 0 ]; then raise_error "build selfhost failed"; fi

echo -e "selfhosting was successful, \
see usage with command $(em "planet --help")"
exit 0
