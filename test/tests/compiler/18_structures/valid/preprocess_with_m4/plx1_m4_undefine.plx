m4_define(`EXIT_ONE', `')m4_dnl
m4_undefine(`EXIT_ONE')m4_dnl

pub fn main(none) i32 {
m4_ifdef(`EXIT_ONE', `
    return 1
', `
    return 0
')m4_dnl
    return 2
}
