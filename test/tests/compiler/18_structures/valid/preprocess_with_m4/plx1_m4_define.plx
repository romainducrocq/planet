m4_define(`CONST_ZERO', 0)m4_dnl
m4_define(`RETURN_VAL', `return $1')m4_dnl

pub fn main(none) i32 {
    RETURN_VAL(CONST_ZERO)
}
