#  Test initialization of nested structs with automatic storage duration,
#  * including:
#  * - partial initialization
#  * - using mix of compound and single initializers to initialize nested structs
#  * - arrays of structs, structs containing arrays
#  * 

import "nested_auto_struct_initializers"








#  case 1: fully initialized struct (include some implicit conversions while
#  we're at it)
pub fn test_full_initialization(none) i32 {
    full: struc outer = $(-200,         $(-171l, $(-56, -54, -53), 40.5),         "Important message!",         -22,         $(1, 2))

    return validate_full_initialization(@full)
}

#  case 2: partially initialized struct
pub fn test_partial_initialization(none) i32 {
    partial: struc outer = $(1000,         $(        1        #  leave two_arr and three_u ininitialized
        ),         "Partial") #  leave four_d uninitialized

    return validate_partial_initialization(@partial)
}

#  case 3: initialize a nested struct with a single expression of struct type
#  rather than a compound initializer
pub fn test_mixed_initialization(none) i32 {
    inner1: struc inner = $(10)
    inner2: struc inner = $(20, $(21), 22u)
    data flag: i32 = 0

    mixed: struc outer = $(        200, ? flag then inner1 else inner2, #  initialize to inner2
        "mixed",         10.0,         $(99,         100)#  still use compound init for second nexted struct, five_pair
        )

    return validate_mixed_initialization(@mixed)
}

#  case 4: initialize an array of structures
pub fn test_array_of_structs(none) i32 {
    s0: struc outer = $(1, $(2, $(3, 4, 5), 6), "7", 8.0, $(9, 10))

    in1: struc inner = $(102, $(103, 104, 105), 106)
    pair1: struc pair = $(109, 110)
    pair2: struc pair = $(209)

    s3: struc outer = $(301)

    struct_array: [4]struc outer = $(        #  struct_array[0]: initialize whole array element w/ one struct
        s0,         $(101, in1, "107", 108.0, pair1),         #  struct_array[2]: partial initialization; compound initialize for one
        #  subelement, single for other
        $(201,         #  struct_array[2].two_struct
        $(202, $(203)),         "207",         208.0,         pair2),         #  struct_array[3]: initialize whole array element from one partially
        #  initialized struct
        s3)

    return validate_array_of_structs(struct_array)
}

pub fn main(none) i32 {
    if not test_full_initialization() {
        return 1
    }

    if not test_partial_initialization() {
        return 2
    }

    if not test_mixed_initialization() {
        return 3
    }

    if not test_array_of_structs() {
        return 4
    }

    return 0 #  success
}
