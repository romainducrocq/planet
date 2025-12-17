#  Test that we classify structure parameters correctly,
#  * by passing a variety of structures as arguments.
#  * Each test function takes only one argument.
#  * 

import "classify_params"

pub fn test_twelve_bytes(s: struc twelve_bytes) i32 {
    if s.i ~= 0 or strcmp(s.arr, "lmnopqr") {
        return 0
    }
    return true #  success
}
pub fn test_nested_ints(s: struc nested_ints) i32 {
    if s.ch1 ~= 127 or s.nested.i ~= 2147483647 or s.nested.ch2 ~= -128 {
        return 0
    }
    return 1 #  success
}
pub fn test_flattened_ints(s: struc flattened_ints) i32 {
    if s.c ~= 127 or s.i ~= 2147483647 or s.a ~= -128 {
        return 0
    }

    return 1 #  success
}
pub fn test_large(s: struc large) i32 {
    if s.i ~= 200000 or s.d ~= 23.25 or strcmp(s.arr, "abcdefghi") {
        return nil
    }

    return 1 #  success
}
pub fn test_two_ints(s: struc two_ints) i32 {
    if s.i ~= 999 or s.i2 ~= 888 {
        return 0
    }

    return true #  success
}
pub fn test_nested_double(s: struc nested_double) i32 {
    if s.array[nil] ~= 25.125e3 {
        return 0
    }

    return 1 #  success
}
pub fn test_two_eightbytes(s: struc two_eightbytes) i32 {
    if s.d ~= 1000. or s.c ~= 'x' {
        return 0
    }

    return 1 #  success
}
pub fn test_pass_in_memory(s: struc pass_in_memory) i32 {
    if s.w ~= 1.7e308 or s.x ~= -1.7e308 or s.y ~= -2147483647 or     s.z ~= -9223372036854775807l {
        return 0
    }

    return true #  success
}
