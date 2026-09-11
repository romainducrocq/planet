#!/usr/bin/env bash

./replace_preprocs.sh

function format () {
    FMT_FILE="$(readlink -f ${1})"
    cp ${FMT_FILE} ./format.out.1
    if [ ${?} -ne 0 ]; then return 1; fi

    vi format.out.1 +'e ++ff=dos | set ff=unix | wq!'
    if [ ${?} -ne 0 ]; then return 1; fi
    clang-format format.out.1 -style=file > format.out.2
    if [ ${?} -ne 0 ]; then return 1; fi
    rm format.out.1
    if [ ${?} -ne 0 ]; then return 1; fi

    diff -sq format.out.2 ${FMT_FILE} | grep -q " differ"
    if [ ${?} -eq 0 ]; then
        mv format.out.2 ${FMT_FILE}
        if [ ${?} -ne 0 ]; then return 1; fi
        echo "format ${FMT_FILE}"
    else
        rm format.out.2
        if [ ${?} -ne 0 ]; then return 1; fi
    fi
    return 0
}

clang-format --help > /dev/null 2>&1
if [ ${?} -ne 0 ]; then
    sudo apt-get install -y clang-format
fi

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

        format ${PLX_FILE}
        if [ ${?} -ne 0 ]; then exit 1; fi
        transpiler-planet -v ${PLX_FILE}
        # if [ ${?} -ne 0 ]; then exit 1; fi
        mv ${PLX_FILE}.transpile ${PLX_FILE}
        if [ ${?} -ne 0 ]; then exit 1; fi

        # Format after transpile
        # --------------------------------------------------

        # remove extra spaces in type struc/union
        sed -i 's|(    |(|g' ${PLX_FILE}
        sed -i 's|    )|)|g' ${PLX_FILE}
        sed -i 's|    , |, |g' ${PLX_FILE}

        # remove lines with empty statement ;
        # except when in files where it makes an empty block
        case "$(basename ${PLX_FILE})" in
            "lexer.plx"|"optim_tac.plx"|"reg_alloc.plx")
                ;;
            *)
                sed -i '/^\s*;\s*$/d' ${PLX_FILE}
                ;;
        esac

        # --------------------------------------------------

        echo "${PLX_FILE}"
    done
done

for PLX_FILE in $(find ${PLX_PATH}/ -name "*.plx" -type f); do
    sed -i 's|pub m4_string_\([0-9]*\): string = \"||g' ${PLX_FILE}
    sed -i 's|)m4_dnl\"|)m4_dnl|g' ${PLX_FILE}
    ./replace_revert.sh ${PLX_FILE}
done

# for PLX_FILE in $(find ${PLX_PATH}/optimizer/ -name "*.plx" -type f); do
#     sed -i "s|^{||g" ${PLX_FILE}
#     sed -i "s|i32 $|i32 {|g" ${PLX_FILE}
# done

echo "transpile successfull"

for PLX_FILE in $(find ${PLX_PATH}/ -name "*.plx" -type f); do
    sed -i 's|\"[[:blank:]]*\", @ARG@\"[[:blank:]]*\"|, |g' ${PLX_FILE}
    sed -i 's|@ARG@\"[[:blank:]]*\"||g' ${PLX_FILE}
    sed -i 's|\"[[:blank:]]*\"@ARG@||g' ${PLX_FILE}
done

exit 0
