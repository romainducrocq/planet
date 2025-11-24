#  Test initialization of static unions; make sure uninitialized
#  unions/sub-objects are initialized to zero
import `static_union_inits`

#  Test case 1 - simple union w/ scalar elements

pub s: union simple = $(217)

#  Test case 2 - union w/ another union as first element

pub h: union has_union = $($(77))

#  Test case 3 - struct containing partially initialized array of unions
#  (make sure we initialize uninitialized values to zero)

pub my_struct: struc has_union_array = $(    $($($('a')), $($('b')), $($('c'))), '#', $('!')    )

#  Test case 4 - uninitialized union (make sure whole thing is initialized to
#  0, not just first element)

pub all_zeros: union has_union;

#  Test case 5 - an array of unions with trailing padding. Make sure padding
#  is included
pub padded_union_array: [3]union with_padding = $(    $("first string"), $("string #2"), $(    "string #3"    )    )

pub fn main(none) i32 {
    if not validate_simple() {
        return 1
    }

    if not validate_has_union() {
        return 2
    }

    if not validate_has_union_array() {
        return 3
    }

    if not validate_uninitialized() {
        return 4
    }

    if not validate_padded_union_array() {
        return 5
    }

    return 0
}
