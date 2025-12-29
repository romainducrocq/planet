#!/bin/bash

mkdir -p ~/.vim/syntax/
if [ ${?} -ne 0 ]; then exit 1; fi

cp -v planet.vim ~/.vim/syntax/
if [ ${?} -ne 0 ]; then exit 1; fi

echo "autocmd BufRead,BufNewFile *.plx,*.plx.m4,*.etc set filetype=planet" >> ~/.vimrc
if [ ${?} -ne 0 ]; then exit 1; fi

cat ~/.vimrc
if [ ${?} -ne 0 ]; then exit 1; fi

exit 0
