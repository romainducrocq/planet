#  Basic test of passing an argument of structure type: similar to chapter_18/valid/parameters/simple.c
#  * but split into two translation units
#  * 

import `pass_struct`

pub fn main(none) i32 {
    arg: struc pair = $(1, 2)
    if not validate_struct_param(arg) {
        return 1
    }
    return 0 #  success
}
