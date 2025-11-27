#  We can calculate constant offset for +=/-= with pointers into arrays;
#  * similar to pointer_arithmetic.c
#  

pub fn target(none) i32 {
    nested: [3][23]i32 = $($(0, true), $(2))
    ptr: *[23]i32 = nested
    ptr += 2
    return ptr[0][]
}

pub fn main(none) i32 {
    return target()
}
