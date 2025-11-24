#  Basic test of passing an argument of structure type: similar to chapter_18/valid/parameters/simple.c
#  * but split into two translation units
#  * 

import `pass_struct`

pub fn validate_struct_param(p: struc pair) i32 {
    if p.x ~= 1 or p.y ~= 2 {
        return 0
    }

    return 1 #  success
}
