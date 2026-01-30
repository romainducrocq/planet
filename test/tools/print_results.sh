#!/usr/bin/env bash

RESULTS_DIR="$(dirname "${0}")/../test_results"
if [ ! -z "${1}" ]; then
    RESULTS_DIR="${RESULTS_DIR}/${1}"
else
    RESULTS_DIR="${RESULTS_DIR}/1"
fi

cd ${RESULTS_DIR}
for FILE in $(ls -lt | grep "\.out\.1" | rev | cut -d' ' -f1 | rev | sed '1!G;h;$!d'); do
    echo "./${FILE}"
    cat "${FILE}" | tail -1
done

exit 0
