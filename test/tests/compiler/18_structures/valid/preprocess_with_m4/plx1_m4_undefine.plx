m4_define(`EXIT_ONE', `')m4_dnl
m4_undefine(`EXIT_ONE')m4_dnl

m4_define(`CONST_ZERO', 0)m4_dnl
m4_define(`CONST_ONE', 1)m4_dnl
m4_define(`RETURN_VAL', `return $1')m4_dnl

pub fn main(none) i32 {
m4_ifdef(`EXIT_ONE', `
    RETURN_VAL(CONST_ONE)
', `
    RETURN_VAL(CONST_ZERO)
')m4_dnl
    return 2
}
