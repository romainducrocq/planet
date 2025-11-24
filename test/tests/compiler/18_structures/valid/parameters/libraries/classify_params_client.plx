#  Test that we classify structure parameters correctly,
#  * by passing a variety of structures as arguments.
#  * Each test function takes only one argument.
#  * 

import `classify_params`

pub fn main(none) i32 {
    s1: struc twelve_bytes = $(0, "lmnopqr")
    if not test_twelve_bytes(s1) {
        return 1
    }

    s2: struc nested_ints = $(127, $(2147483647, -128))
    if not test_nested_ints(s2) {
        return 2
    }

    s3: struc flattened_ints = $(127, 2147483647, -128)
    if not test_flattened_ints(s3) {
        return 3
    }

    s4: struc large = $(200000, 23.25, "abcdefghi")
    if not test_large(s4) {
        return 4
    }

    s5: struc two_ints = $(999, 888)
    if not test_two_ints(s5) {
        return 5
    }

    s6: struc nested_double = $($(25.125e3))
    if not test_nested_double(s6) {
        return 6
    }

    s7: struc two_eightbytes = $(1000., 'x')
    if not test_two_eightbytes(s7) {
        return 7
    }

    s8: struc pass_in_memory = $(1.7e308, -1.7e308, -2147483647, -9223372036854775807l)
    if not test_pass_in_memory(s8) {
        return 8
    }

    return 0 #  success
}
