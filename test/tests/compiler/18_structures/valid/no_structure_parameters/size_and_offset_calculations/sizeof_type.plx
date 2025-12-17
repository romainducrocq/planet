#  Verify that sizeof produces correct results for various structure types (and
#  * arrays of structs) 

import "struct_sizes"

pub fn main(none) i32 {
    #  validate the size of every type in struct_sizes.h

    if sizeof<struc eight_bytes> ~= 8 {
        return 1
    }

    if sizeof<struc two_bytes> ~= 2 {
        return 2
    }

    if sizeof<struc three_bytes> ~= 3 {
        return 3
    }

    if sizeof<struc sixteen_bytes> ~= 16 {
        return 4
    }

    if sizeof<struc seven_bytes> ~= 7 {
        return 5
    }

    if sizeof<struc twentyfour_bytes> ~= 24 {
        return 6
    }

    if sizeof<struc twenty_bytes> ~= 20 {
        return 7
    }

    if sizeof<struc wonky> ~= 19 {
        return 8
    }

    if sizeof<struc internal_padding> ~= 16 {
        return 9
    }

    if sizeof<struc contains_struct_array> ~= 28 {
        return 10
    }

    if sizeof<[4]struc internal_padding> ~= 64 {
        return 11
    }

    if sizeof<[2]struc wonky> ~= 38 {
        return 12
    }

    return 0 #  success
}
