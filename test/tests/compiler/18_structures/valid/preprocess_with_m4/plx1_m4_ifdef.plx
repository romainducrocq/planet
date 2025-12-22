# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_ifdef(`MAGIC_VAL', `
magic_char: char = M4_CHAR(*)
', `
m4_include(`return_val.plx.m4')m4_dnl

m4_define(`TOGGLE', `ON')m4_dnl
m4_ifdef(`TOGGLE', `
m4_define(`EXIT_ZERO', CONST_ZERO)m4_dnl
m4_undefine(`CONST_ZERO')m4_dnl
', `
')m4_dnl

pub fn main(none) i32 {
m4_ifdef(`CONST_ZERO', `
    RETURN_VAL(CONST_ONE)
',`
m4_ifdef(`EXIT_ZERO', `
    RETURN_VAL(EXIT_ZERO)
',`
    RETURN_VAL(CONST_TWO)
')m4_dnl
')m4_dnl
    return 3
}
')m4_dnl
