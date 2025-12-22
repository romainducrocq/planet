# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_define(`M4_INCR', `m4_$1($2)')m4_dnl
m4_define(`CONST_TWO_DECR', `M4_INCR(decr, 2)')m4_dnl
m4_define(`CONST_FOUR_INCR', `M4_INCR(incr, 4)')m4_dnl

m4_sinclude(`not_a_file.plx.m4')m4_dnl

m4_define(`IMPORT_GET_SUCCESS', `
import "../../invalid_lex/get_success"
')m4_dnl

m4_include(`return_val.plx.m4')m4_dnl

IMPORT_GET_SUCCESS

pub fn main(none) i32 {
    if CONST_TWO_DECR ~= 1 { RETURN_VAL(CONST_ONE) }
    if CONST_FOUR_INCR ~= 5 { RETURN_VAL(CONST_TWO) }
    if (m4_len(`m4_defn(`CONST_FOUR_INCR')') 
        ~= m4_len(qwertyuiopasdfghjklzxcvbnm)) {
        RETURN_VAL(CONST_THREE)
    }

    RETURN_VAL(get_success())
    return 4
}
