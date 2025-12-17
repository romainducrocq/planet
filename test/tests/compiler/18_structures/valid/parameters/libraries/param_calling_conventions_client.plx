#  Test that we can pass a mix of struct and non-struct arguments according to
#  * the ABI 

import "param_calling_conventions"

pub fn main(none) i32 {
    #  define a bunch of structures
    two_longs: struc two_longs = $(1234567l, 89101112l)
    one_int: struc one_int = $(54320, 'c')
    one_long: struc one_int_exactly = $(567890l)
    two_ints: struc two_ints = $('_', $(5, 6, 7))
    two_ints_nested: struc two_ints_nested = $(one_int, one_int)
    xii: struc twelve_bytes = $(123, "string!")

    one_xmm: struc one_xmm = $(5.125)
    two_xmm: struc two_xmm = $($(55.5, 44.4))
    int_and_xmm: struc int_and_xmm = $('p', 4.56)
    xmm_and_int: struc xmm_and_int = $($(1.234), "hi")

    odd: struc odd_size = $("lmno")
    mem: struc memory = $(15.75, "rs", 4444, 3333)

    #  call validation functions

    if not pass_small_structs(two_xmm, one_int, one_xmm, xmm_and_int, xii,         one_long) {
        return 1
    }

    #  based on example in Listing 18-45
    if not a_bunch_of_arguments(0, 1, 2, 3, 4, two_longs, 5) {
        return 2
    }

    if not structs_and_scalars(10, 10.0, odd, mem, one_xmm) {
        return 2
    }

    if not struct_in_mem(10.0, 
        11.125, 12.0, xmm_and_int, 13.0, two_xmm, 0,         int_and_xmm, one_xmm) {
        return 3
    }
    if not pass_borderline_struct_in_memory(two_ints, '!', int_and_xmm, 0,         two_ints_nested, 7.8) {
        return 4
    }

    #  define some more structs to use in last two test cases
    struct1: struc twelve_bytes = $(-1, $(127, 126, 125))
    struct2: struc twelve_bytes = $(-5, $(100, 101, 102))
    os: struc odd_size = $($(100, 99, 98, 97, 96))
    m: struc memory = $(5.345, $(-1, -2, -3), 4294967300l, 10000)
    if not pass_uneven_struct_in_mem(struct1, 9223372036854775805l,         9223372036854775800l, struct2, os, m) {
        return 5
    }

    if not pass_later_structs_in_regs(m, struct1, one_xmm) {
        return 6
    }

    #  success!
    return 0
}
