#  Test passing struct pointers as function parameters 

import `param_struct_pointer`

pub fn main(none) i32 {
    s: struc outer = $(1, 2, $(3.0, 4))
    if not access_members_through_pointer(@s, 1, 2, 3.0, 4) {
        return 1
    }

    inner_struct: struc inner = $(7, 8)
    update_members_through_pointer(@s, 5, 6, @inner_struct)
    if s.a ~= 5 or s.b ~= 6 or s.substruct.d ~= 7 or s.substruct.i ~= 8 {
        return 2
    }

    return 0 #  success
}
