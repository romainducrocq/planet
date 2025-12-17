#  Test that we can pass a pointer to an array of structures as a parameter 

import "array_of_structs"

static_array: [3]struc outer = $(    $(0, $(false, $(0, nil))), $(
    2, $(3, $(4, 5))), $(4, $(6, $(8, 10))))

pub fn main(none) i32 {
    auto_array: [3]struc outer = $(        $(0, $(0, $(0, false))), $(2, $(3, $(4, 5))), $(4, $(6, $(8, 10))))

    #  pass pointers to struct arrays with both static and automatic storage
    #  both have same contents so we can validate them with the same function

    if not validate_struct_array(static_array) {
        return 1
    }

    if not validate_struct_array(auto_array) {
        return 2
    }

    return 0 #  success
}
