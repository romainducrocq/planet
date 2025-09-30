#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat backend_path.txt))"
export EXTERN_FRONTEND_PARSER_DIR="$(readlink -f ../frontend/parser)"
# export EXTERN_FRONTEND_INTERM_DIR="$(readlink -f ../frontend/intermediate)"

cd ${BACKEND_PATH}/bin/
./make.sh ${1}
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
