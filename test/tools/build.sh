#!/bin/bash

BACKEND_PATH="$(readlink -f ../../wheelcc)"
cp -v ../../frontend/* ${BACKEND_PATH}/src/frontend/parser/

cd ../
./build.sh ${@}
cd tools/

exit 0
