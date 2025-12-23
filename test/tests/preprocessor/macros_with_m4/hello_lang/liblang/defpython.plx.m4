m4_define(`if', `')m4_dnl
m4_define(`__name__', `
pub fn puts(s: string) i32;
pub fn main(none) i32 {
    _main__: i32;
    0')m4_dnl
m4_define(`print', `
    puts($1)
    return MAGIC_VAL
}')m4_dnl
m4_changequote(`"_', `":')m4_dnl
