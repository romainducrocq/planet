#  Verify that sizeof produces correct results for various expressions of
#  * structure type. This is almost identical of sizeof_type except we're applying
#  * sizeof to expressions and not just type specifiers.
#  * This also tests that we correctly infer the types of expressions w/ structure
#  * type
#  * 

import `struct_sizes`

pub fn get_twentybyte_ptr(none) *struc twenty_bytes {
    return 0
}

pub fn main(none) bool {
    #  validate the size of every type in struct_sizes.h

    arr_struct: struc contains_struct_array;

    if sizeof(arr_struct.struct_array[2]) ~=     8 { #  elements of struct_array have type struct eight_bytes
        return 1
    }

    data twentyfour: struc twentyfour_bytes;
    if sizeof(twentyfour.seven.two2) ~= 2 {
        return 2
    }

    if sizeof(get_twentybyte_ptr()[].sixteen.three) ~= 3 {
        return 3
    }

    if sizeof(get_twentybyte_ptr()[].sixteen) ~= 16 {
        return 4
    }

    if sizeof(twentyfour.seven) ~= 7 {
        return 5
    }

    if sizeof(twentyfour) ~= 24 {
        return 6
    }

    if sizeof(get_twentybyte_ptr()[]) ~= 20 {
        return 7
    }

    if sizeof((cast<*struc wonky>(0))[]) ~= 19 {
        return 8
    }

    extrn struct_array: [4]struc internal_padding;
    if sizeof(struct_array[0]) ~= 16 {
        return 9
    }

    if sizeof(arr_struct) ~= 28 {
        return 10
    }

    if sizeof(struct_array) ~= 64 {
        return 11
    }

    #  make sure arr_struct.struct_array doesn't undergo array decay here
    if sizeof(arr_struct.struct_array) ~= 24 {
        return 12
    }

    return 0 #  success
}
