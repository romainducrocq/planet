#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat backend_path.txt))"
export EXTERN_FRONTEND_PARSER_DIR="$(readlink -f ../frontend/parser)"
# export EXTERN_FRONTEND_INTERM_DIR="$(readlink -f ../frontend/intermediate)"
if [ -d "${BACKEND_PATH}/src/frontend/parser/" ]; then
    mv ${BACKEND_PATH}/src/frontend/parser/ ${BACKEND_PATH}/src/frontend/parser.bak/
    if [ ${?} -ne 0 ]; then exit 1; fi
fi
# if [ -d "${BACKEND_PATH}/src/frontend/intermediate/" ]; then
#     mv ${BACKEND_PATH}/src/frontend/intermediate/ ${BACKEND_PATH}/src/frontend/intermediate.bak/
#     if [ ${?} -ne 0 ]; then exit 1; fi
# fi

cd ${BACKEND_PATH}/bin/
./make.sh ${1}
if [ ${?} -ne 0 ]; then exit 1; fi
