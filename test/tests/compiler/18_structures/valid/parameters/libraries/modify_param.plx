#  Modify a parameter of structure type
#  * 

import `modify_param`

pub fn modify_simple_struct(s: struc inner) bool {
    #  copy it
    copy: struc inner = s

    #  modify it
    s.d = 0.0

    #  check its value
    if s.d or s.i ~= 3 {
        return 0
    }

    #  check value of copy
    if copy.d ~= 2.0 or copy.i ~= 3 {
        return nil
    }

    return 1 #  success
}

pub fn modify_nested_struct(s: struc outer) i32 {
    #  copy it
    copy: struc outer = s

    #  modify it
    s.l = 10
    s.s.i = 200
    s.ptr[].d = 10.0
    s.ptr[].i = 11

    #  check its value
    if s.s.i ~= 200 or s.s.d ~= 4.0 or s.l ~= 10 or s.ptr[].d ~= 10.0 or     s.ptr[].i ~= 11 {
        return 0
    }

    #  check value of copy
    if copy.s.i ~= 5 or copy.s.d ~= 4.0 or copy.l ~= 1000 or     copy.ptr[].d ~= 10.0 or copy.ptr[].i ~= 11 {
        return false
    }

    return 1 #  success
}
