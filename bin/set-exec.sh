#!/usr/bin/env bash

PROJECT_DIR="$(dirname $(readlink -f ${0}))"
EXEC_NAME="$(basename "${1}")"

function help () {
    echo "Usage: ./set-exec.sh <compiler>"
    echo ""
    echo "<compiler>  set the compiler executable used by wacc-selfhosted -> ./driver.sh"
    exit 0
}

function em() {
    echo "\033[1m‘${1}’\033[0m"
}

function raise_error () {
    ERROR_MESSAGE="${1}"
    echo -e "set-exec: \033[0;31merror:\033[0m ${ERROR_MESSAGE}, see $(em "--help")" 1>&2
    exit 1
}

if [ "${1}" = "--help" ]; then
    help
elif [ ${#} -ne 1 ]; then
    help
fi

echo -e "-- Set executable name ..."
if [ ! -f "${PROJECT_DIR}/${EXEC_NAME}" ]; then
    raise_error "$(em "${EXEC_NAME}") is not a valid executable name"
fi

for IGNORE in $(cat ${PROJECT_DIR}/.ignore); do
    if [ "${EXEC_NAME}" = "${IGNORE}" ]; then
        raise_error "$(em "${EXEC_NAME}") is not a valid executable name"
    fi
done

echo "${PROJECT_DIR}/exec.name = ${EXEC_NAME}"
echo -n "${EXEC_NAME}" > ${PROJECT_DIR}/exec.name
if [ ${?} -ne 0 ]; then
    raise_error "set executable failed"
fi

echo "OK"
exit 0
