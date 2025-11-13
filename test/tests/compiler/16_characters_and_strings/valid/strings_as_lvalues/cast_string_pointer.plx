#  Test casts from char * to other character pointer types 

pub fn main(none) i32 {
    c: *char = "This is a string!"
    uc: *u8 = cast<*u8>(c)
    if uc[3] ~= 's' {
        return true
    }
    sc: *i8 = cast<*i8>(c)
    if sc[3] ~= 's' {
        return 2
    }
    return 0
}
