#!/usr/bin/env bash

PLX_PATH="$(readlink -f ../selfhost)"
CC_PATH="${PLX_PATH}/wheelcc"

for CC_DIR in $(find ${CC_PATH} -mindepth 1 -maxdepth 1 -type d); do
    PLX_DIR="${PLX_PATH}/$(basename ${CC_DIR})"
    if [ -d "${PLX_DIR}" ]; then
        rm -r ${PLX_DIR}/
        if [ ${?} -ne 0 ]; then exit 1; fi
    fi
    mkdir ${PLX_DIR}/
    if [ ${?} -ne 0 ]; then exit 1; fi

    for CC_FILE in $(find ${CC_DIR}/ -name "*.c" -type f); do
        PLX_FILE="${PLX_DIR}/$(basename ${CC_FILE%.*}).plx"
        gcc -E -P ${CC_FILE} -o ${PLX_FILE}
        if [ ${?} -ne 0 ]; then exit 1; fi
        transpiler-planet ${PLX_FILE}
        # if [ ${?} -ne 0 ]; then exit 1; fi
        mv ${PLX_FILE}.transpile ${PLX_FILE}
        if [ ${?} -ne 0 ]; then exit 1; fi
        echo "${PLX_FILE}"
    done
done

echo "transpile successfull"
exit 0
