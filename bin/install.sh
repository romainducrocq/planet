#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat backend_path.txt))"

cd ${BACKEND_PATH}/bin/
./install.sh
if [ ${?} -ne 0 ]; then exit 1; fi
