m4_define(`public', `')m4_dnl
m4_define(`class', `
pub fn puts(s: string) i32;
type struc _sa(_x: i32)
type struc _sb(out: struc _sa)
_s: struc _sb;
')m4_dnl
m4_define(`HelloJava', `
pub fn `main' (none) i32')m4_dnl
m4_define(`static', `')m4_dnl
m4_define(`void', `')m4_dnl
m4_define(`main', `')m4_dnl
m4_define(`System', `_s')m4_dnl
m4_define(`println', `_x
    puts($1)
')m4_dnl
