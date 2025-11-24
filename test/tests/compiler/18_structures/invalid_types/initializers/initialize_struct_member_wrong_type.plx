type struc s(    char_ptr: *i8    )

pub fn main(none) i32 {
    #  because the structure member char_ptr has type signed char *,
    #  rather than char *, we can't initialize it with a string literal
    x: struc s = $("It's a string")
    return 0
}
