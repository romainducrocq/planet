#!/bin/bash

BACKEND_PATH="$(readlink -f $(cat ../bin/backend_path.txt))"

${BACKEND_PATH}/test/test-all.sh
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
