#!/usr/bin/env bash

NANO_RC="${HOME}/.nanorc"
NANO_RUNTIME="${HOME}/.nano"
VIM_RC="${HOME}/.vimrc"
VIM_RUNTIME="${HOME}/.vim"
NEOVIM_RUNTIME="${HOME}/.config/nvim"
VSCODE_RUNTIME="${HOME}/.vscode"

EDITOR="${1}"

function help () {
    echo "Usage: ./set_editors.sh {--nano | --neovim | --vim | --vscode}"
    exit 0
}

function em () {
    echo "\033[1m‘${1}’\033[0m"
}

function raise_error () {
    ERROR_MESSAGE="${1}"
    echo -e "set_editors: \033[0;31merror:\033[0m ${ERROR_MESSAGE}, see $(em "--help")" 1>&2
    exit 1
}

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
    mkdir -p ${NEOVIM_RUNTIME}/syntax/
    if [ ${?} -ne 0 ]; then return 1; fi
    mkdir -p ${NEOVIM_RUNTIME}/ftdetect/
    if [ ${?} -ne 0 ]; then return 1; fi
    cp -v $(readlink -f planet.vim) ${NEOVIM_RUNTIME}/syntax/
    if [ ${?} -ne 0 ]; then return 1; fi
    echo "autocmd BufRead,BufNewFile *.plx,*.plx.m4,*.etc set filetype=planet" > ${NEOVIM_RUNTIME}/ftdetect/planet.vim
    if [ ${?} -ne 0 ]; then return 1; fi
    cat ${NEOVIM_RUNTIME}/ftdetect/planet.vim | tail -1
    if [ ${?} -ne 0 ]; then return 1; fi
}

function setup_vscode () {
    mkdir -p ${VSCODE_RUNTIME}/extensions/
    if [ ${?} -ne 0 ]; then return 1; fi
    cp -rv $(readlink -f planet-vscode) ${VSCODE_RUNTIME}/extensions/
    if [ ${?} -ne 0 ]; then return 1; fi
}

function set_editor () {
    cd ../editors/
    case "${EDITOR}" in
        "--nano")
            setup_nano
            return ${?}
            ;;
        "--neovim")
            setup_neovim
            return ${?}
            ;;
        "--vim")
            setup_vim
            return ${?}
            ;;
        "--vscode")
            setup_vscode
            return ${?}
            ;;
        *)
            return 1
    esac
}

if [ "${1}" = "--help" ]; then
    help
elif [ ${#} -ne 1 ]; then
    help
fi

set_editor
if [ ${?} -ne 0 ]; then
    raise_error "failed to setup editor for $(em "${EDITOR}")"
fi

echo -e "setting up editor was successful for $(em "${EDITOR}")"
exit 0
