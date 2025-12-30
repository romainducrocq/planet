#!/bin/bash

NANO_RC="${HOME}/.nanorc"
NANO_RUNTIME="${HOME}/.nano"

VIM_RC="${HOME}/.vimrc"
VIM_RUNTIME="${HOME}/.vim"

NEOVIM_RUNTIME="${HOME}/.config/nvim"

function setup_nano () {
    mkdir -p ${NANO_RUNTIME}/
    if [ ${?} -ne 0 ]; then return 1; fi
    cp -v $(readlink -f planet.nanorc) ${NANO_RUNTIME}/
    if [ ${?} -ne 0 ]; then return 1; fi
    echo "include ${NANO_RUNTIME}/planet.nanorc" >> ${NANO_RC}
    if [ ${?} -ne 0 ]; then return 1; fi
    cat ${NANO_RC} | tail -1
    if [ ${?} -ne 0 ]; then return 1; fi
}

function setup_vim () {
    mkdir -p ${VIM_RUNTIME}/syntax/
    if [ ${?} -ne 0 ]; then return 1; fi
    cp -v $(readlink -f planet.vim) ${VIM_RUNTIME}/syntax/
    if [ ${?} -ne 0 ]; then return 1; fi
    echo "autocmd BufRead,BufNewFile *.plx,*.plx.m4,*.etc set filetype=planet" >> ${VIM_RC}
    if [ ${?} -ne 0 ]; then return 1; fi
    cat ${VIM_RC} | tail -1
    if [ ${?} -ne 0 ]; then return 1; fi
}

function setup_neovim () {
    echo "TODO setup neovim not available yet"; return 1
    # TODO
    mkdir -p ${NEOVIM_RUNTIME}/syntax/
    if [ ${?} -ne 0 ]; then return 1; fi
    mkdir -p ${NEOVIM_RUNTIME}/ftdetect/
    if [ ${?} -ne 0 ]; then return 1; fi
    cp -v planet.vim ${NEOVIM_RUNTIME}/syntax/
    if [ ${?} -ne 0 ]; then return 1; fi
    echo "autocmd BufRead,BufNewFile *.plx,*.plx.m4,*.etc set filetype=planet" >> ${NEOVIM_RUNTIME}/ftdetect/planet.vim
    if [ ${?} -ne 0 ]; then return 1; fi
    cat ${NEOVIM_RUNTIME}/ftdetect/planet.vim | tail -1
    if [ ${?} -ne 0 ]; then return 1; fi
}

SET_STATUS=0
case "${1}" in
    "--nano")
        setup_nano
        SET_STATUS=${?}
        ;;
    "--neovim")
        setup_neovim
        SET_STATUS=${?}
        ;;
    "--vim")
        setup_vim
        SET_STATUS=${?}
        ;;
    *)
        echo "Usage: ${0} {--nano | --neovim | --vim}"
        exit 0
esac

if [ ${SET_STATUS} -ne 0 ]; then
    echo -e "\033[0;31merror:\033[0m setup editor failed for \033[1m‘${1}’\033[0m" 1>&2
    exit 1
fi

echo -e "setup editor was successful for \033[1m‘${1}’\033[0m"
exit 0
