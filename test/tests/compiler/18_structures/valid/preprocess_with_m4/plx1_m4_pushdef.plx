# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_include(`defchar.plx.m4')m4_dnl
m4_include(`return_val.plx.m4')m4_dnl

m4_define(`MAGIC_VAL', CONST_ZERO)m4_dnl
m4_pushdef(`MAGIC_VAL', M4_CHAR(*))m4_dnl
m4_pushdef(`CONST_ZERO', MAGIC_VAL)m4_dnl
fn get_magic(none) i32 {
    RETURN_VAL(CONST_ZERO + 1)
}
m4_popdef(`CONST_ZERO')m4_dnl

pub fn main(none) i32 {
    if MAGIC_VAL ~= 42 {
        RETURN_VAL(CONST_ONE)
    }
m4_pushdef(`MAGIC_VAL', get_magic())m4_dnl
    if MAGIC_VAL ~= 43 {
        RETURN_VAL(CONST_TWO)
    }
m4_popdef(`MAGIC_VAL')m4_dnl
    if MAGIC_VAL ~= 42 {
        RETURN_VAL(CONST_THREE)
    }
m4_popdef(`MAGIC_VAL')m4_dnl

    RETURN_VAL(MAGIC_VAL)
    return 4
}
