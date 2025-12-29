" Vim syntax file
" Language: planet

" Usage Instructions
" Put this file in .vim/syntax/planet.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.plx,*.plx.m4,*.etc set filetype=planet

if exists("b:current_syntax")
  finish
endif

" Type names the compiler recognizes
syntax keyword planetTypes any bool cast char data extrn f64 fn i32 i64 i8 none pub sizeof string struc type u32 u64 u8 union

" Language keywords
syntax keyword planetKeywords and break continue elif else if jump label loop match not or otherwise return then while

" Single-quoted stuff (characters, backslash escapes)
syntax match planetChar "'([^'\]|\\(["'\abfnrtv]))'"

" Strings and names of included files
syntax region planetString ""([^"]|\\")*""

" Comments
syntax region planetComments start="#" end="$" contains=planetTodos

" Reminders
syntax keyword planetTodos FIXME TODO XXX

" Set highlights
highlight default link planetTypes Type
highlight default link planetKeywords Keyword
highlight default link planetChar Character
highlight default link planetString String
highlight default link planetComments Comment
highlight default link planetTodos Todo

let b:current_syntax = "planet"
