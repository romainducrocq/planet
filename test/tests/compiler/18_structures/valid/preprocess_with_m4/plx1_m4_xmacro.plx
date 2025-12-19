# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_define(`COLOR_ENUM', `
    M4_X(`COLOR_BLACK', 0, `"black"')
    M4_X(`COLOR_RED', 1, `"red"')
    M4_X(`COLOR_GREEN', 2, `"green"')
    M4_X(`COLOR_BLUE', 3, `"blue"')
    M4_X(`COLOR_WHITE', 4, `"white"')
')m4_dnl
m4_define(`COLOR_SIZE', `m4_incr(COLOR_WHITE)')m4_dnl

m4_define(`RETURN_VAL', `return $1')m4_dnl

m4_define(`M4_X', `m4_define(`$1', $2)')m4_dnl
COLOR_ENUM
m4_undefine(`M4_X')m4_dnl

m4_define(`M4_X', `, m4_incr($1)')m4_dnl
arr: [m4_incr(COLOR_SIZE)]i32 = $(0 COLOR_ENUM)
m4_undefine(`M4_X')m4_dnl

m4_define(`M4_X', `    -> $1 { RETURN_VAL($3) }')m4_dnl
fn get_enum_str(x: i32) *char {
    match arr[x + 1] - 1 {
        COLOR_ENUM
        otherwise { RETURN_VAL("") }
    }
}
m4_undefine(`M4_X')m4_dnl

use "string"

m4_define(`M4_X', `if strcmp(get_enum_str(arr[$1]), $3) {
        RETURN_VAL(m4_incr($1))
    }')m4_dnl
pub fn main(none) i32 {
    COLOR_ENUM
    RETURN_VAL(0)
    return 5
}
m4_undefine(`M4_X')m4_dnl
