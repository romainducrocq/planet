" Vim syntax file
" Language: planet

" Usage Instructions
" Put this file in .vim/syntax/planet.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.plx,*.plx.m4,*.etc set filetype=planet

" Set to v:true for vim color scheme
let s:set_vim_colors = v:false

if exists("b:current_syntax")
  finish
endif

" Constants
syn match planetConstant "\<\([A-Z_][0-9A-Z_]*\|false\|nil\|true\)\>"

" Types and related keywords
syn keyword planetType any bool cast char data extrn f64 i32 i64 i8 none pub sizeof string struc type u32 u64 u8 union

" Flow control
syn keyword planetKeyword and elif else if loop match not or otherwise then while
syn keyword planetLabel break continue jump label return

" Function definitions
syn match planetFunction "\<fn\>\([[:blank:]]\+[a-zA-Z_][0-9a-zA-Z_]*\)\?"

" Single-quoted stuff (characters, backslash escapes)
syn match planetCharacter "\'\([^\'\\]\|\\\([\"\'\abfnrtv]\)\)\'"

" Strings and names of included files
syn match planetString "\"\([^\"]\|\\\"\)*\""

" Preprocessor directives
syn match planetPreProc "^[[:blank:]]*\(import\|use\)"
syn match planetMacro "\<m4_[0-9a-zA-Z_]*\>"

" Comments
syn region planetComment start="#" end="$" contains=planetTodo

" Reminders
syn keyword planetTodo FIXME TODO XXX

" Set highlights
if s:set_vim_colors
    hi def link planetConstant Constant
    hi def link planetType Type
    hi def link planetKeyword Keyword
    hi def link planetLabel Label
    hi def link planetFunction Function
    hi def link planetCharacter Character
    hi def link planetString String
    hi def link planetPreProc PreProc
    hi def link planetMacro Macro
    hi def link planetComment Comment
    hi def link planetTodo Todo
else
    hi planetConstant cterm=bold ctermfg=red
    hi planetType ctermfg=green
    hi planetKeyword cterm=bold ctermfg=yellow
    hi planetLabel ctermfg=magenta
    hi planetFunction ctermfg=blue
    hi planetCharacter cterm=bold ctermfg=magenta
    hi planetString cterm=bold ctermfg=yellow
    hi planetPreProc cterm=bold ctermfg=cyan
    hi planetMacro cterm=bold ctermfg=cyan
    hi planetComment cterm=bold ctermfg=blue
    hi planetTodo cterm=bold ctermbg=white ctermfg=yellow
endif

let b:current_syntax = "planet"
