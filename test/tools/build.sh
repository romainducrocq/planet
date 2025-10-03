#!/bin/bash

BACKEND_PATH="$(readlink -f ../../../wheelcc)"
cp -v ../../frontend/parser/* ${BACKEND_PATH}/src/frontend/parser/
# cp -v ../../frontend/intermediate/* ${BACKEND_PATH}/src/frontend/intermediate/

cd ../
./build.sh ${@}
cd tools/

exit 0
