# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_sinclude(`not_a_file.plx.m4')m4_dnl
m4_sinclude(`../../invalid_lex/get_success.etc')m4_dnl

m4_include(`defchar.plx.m4')m4_dnl
m4_include(`return_val.plx.m4')m4_dnl
m4_include(`../../invalid_lex/magic_define.etc')m4_dnl
m4_include(`../preprocess_with_m4/plx1_m4_ifdef.plx')m4_dnl

pub fn main(none) i32 {
    if MAGIC_VAL == magic_char {
        RETURN_VAL(get_success())
    }
    return 1
}
