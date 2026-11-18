#!/usr/bin/env bash

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

if [ ! -f "${PROJECT_NAME}" ]; then
    raise_error "$(em "planet") bootstrap was not built, \
run $(em "./configure.sh && ./make.sh") first and try again"
fi

planet --help > /dev/null 2>&1
if [ ${?} -ne 0 ]; then
    raise_error "$(em "planet") bootstrap was not installed, \
run $(em "./install.sh") and reload your shell configuration"
fi

cp ${PROJECT_NAME} ${PROJECT_NAME}.old

echo "-- Build executable ..."
planet -v -O2 -E -D${OS_MACRO} -I${SELFHOST_DIR}/ -o ${PROJECT_NAME} \
    ${SOURCE_FILES}
if [ ${?} -ne 0 ]; then
    raise_error "build selfhost failed"
fi
echo "OK"
echo "-- Created target ${PROJECT_NAME}"

cmp -s ${PROJECT_NAME} ${PROJECT_NAME}.old
if [ ${?} -eq 0 ]; then
    echo "-- Fixed point reached: \
bootstrap and selfhost are byte-identical"
fi

echo -e "selfhosting was successful, \
see usage with command $(em "planet --help")"
exit 0
