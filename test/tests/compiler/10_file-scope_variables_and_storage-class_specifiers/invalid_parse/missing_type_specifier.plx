# A declaration must have at least one type specifier
# (Clang/GCC warn instead of failing here)
#
var = 0

pub fn main(none) i32 {
    return var
}
