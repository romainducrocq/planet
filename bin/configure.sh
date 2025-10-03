#!/bin/bash

BACKEND_PATH="$(readlink -f ../../wheelcc)"
PACKAGE_PATH="$(readlink -f ..)"
PACKAGE_NAME="planet"
FILENAME_EXT="plx"

function config_backend () {
    # bin
    find . -type l -delete
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/bin/driver.sh ./driver.sh
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/bin/make.sh ./make.sh
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/bin/install.sh ./install.sh
    if [ ${?} -ne 0 ]; then return 1; fi

    # test
    find ../test/ -type l -delete
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/test/build.sh ../test/build.sh
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/test/get-dependencies.sh ../test/get-dependencies.sh
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/test/test-all.sh ../test/test-all.sh
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/test/test-compiler.sh ../test/test-compiler.sh
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/test/test-errors.sh ../test/test-errors.sh
    if [ ${?} -ne 0 ]; then return 1; fi
    ln -s ${BACKEND_PATH}/test/test-memory.sh ../test/test-memory.sh
    if [ ${?} -ne 0 ]; then return 1; fi
    cp ../test/tools/print_errors.in ${BACKEND_PATH}/test/tools/
    if [ ${?} -ne 0 ]; then return 1; fi

    # frontend
    cp ../frontend/parser/* ${BACKEND_PATH}/src/frontend/parser/
    if [ ${?} -ne 0 ]; then return 1; fi
    # cp ../frontend/intermediate/* ${BACKEND_PATH}/src/frontend/intermediate/
    # if [ ${?} -ne 0 ]; then return 1; fi

    # config
    echo -n "${FILENAME_EXT}" > ${BACKEND_PATH}/bin/filename_ext.txt
    if [ ${?} -ne 0 ]; then return 1; fi
    echo -n "${PACKAGE_PATH}" > ${BACKEND_PATH}/bin/package_path.txt
    if [ ${?} -ne 0 ]; then return 1; fi

    return 0
}

config_backend
if [ ${?} -ne 0 ]; then
    echo -e "\033[0;31merror:\033[0m configuration failed" 1>&2
    exit 1
fi

# TODO for includes use .etc
# TODO install m4 as preprocessor
# TODO preprocess with m4 in wheelcc/bin/driver.sh
# TODO link with build/build_lib in wheelcc/bin/driver.sh
# TODO compile std in wheelcc/bin/make.sh if build/build_lib.sh exist
# TODO install std in wheelcc/bin/install.sh if build/build_lib/ exist

${BACKEND_PATH}/bin/configure.sh "${PACKAGE_NAME}"
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
