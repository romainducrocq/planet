#  Test initialization of non-nested static structs, including:
#  * - partial initialization
#  * - implicit conversion of scalar elements
#  * - array decay of string literals
#  

import `static_struct_initializers`











#  case 1: struct with no explicit initializer should be all zeros
pub uninitialized: struc s;

#  case 2: partially initialized struct
pub partial: struc s = $(1.0, "Hello")

#  case 3: partially initialized array w/in struct
pub partial_with_array: struc s = $(3.0, "!"
    , $(1), 2)

#  case 4: implicit conversion of scalar elements
pub converted: struc s = $(    1152921504606846977l, #  1152921504606846976.0
    0l, #  null ptr
    "abc", #  {'a', 'b', 'c'}
    17179869189l#  5
    )

pub fn main(none) i32 {
    if not test_uninitialized() {
        return true
    }

    if not test_partially_initialized() {
        return 2
    }

    if not test_partial_inner_init() {
        return 3
    }

    if not test_implicit_conversion() {
        return 4
    }

    return 0 #  success
}

