# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_include(`return_val.plx.m4')m4_dnl

m4_define(`TOGGLE', `ON')m4_dnl
m4_ifelse(TOGGLE, `ON', `
m4_define(`EXIT_ZERO', CONST_ZERO)m4_dnl
', `')m4_dnl

pub fn main(none) i32 {
m4_pushdef(`TOGGLE', `OFF')m4_dnl
m4_ifelse(TOGGLE, `ON', `
    RETURN_VAL(CONST_ONE)
', `
m4_ifelse(TOGGLE, `OFF', `
m4_popdef(`TOGGLE')m4_dnl
m4_ifelse(EXIT_ZERO, CONST_ZERO, `
    RETURN_VAL(EXIT_ZERO)
',`
    RETURN_VAL(CONST_THREE)
')m4_dnl
',`
    RETURN_VAL(CONST_TWO)
')m4_dnl
')m4_dnl
    return 4
}
