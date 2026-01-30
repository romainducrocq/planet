#!/usr/bin/env bash

ROOT="${PWD}/../.."
BACKEND_PATH="$(readlink -f ../../wheelcc)"

cd ${BACKEND_PATH}/test/tools/
for FILE in $(find ${ROOT}/frontend/ -type f); do
    python3 check_idlen.py ${FILE}
    ./format.sh ${FILE}
done

exit 0
