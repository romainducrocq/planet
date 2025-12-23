m4_define(`fn', `pub !(fn); puts(s: string) i32;
pub !(fn main); (argc: i32, argv: *string) i32')m4_dnl
m4_define(`main', `')m4_dnl
m4_define(`println', `data _s: string;
    if argc == 1 {
        !(main); (0, nil)
        puts(_s)
        return MAGIC_VAL
    }
    _s = ')m4_dnl
m4_changequote(`!(', `);')m4_dnl
