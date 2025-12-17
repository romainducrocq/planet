#  Test initialization of non-nested structs with automatic storage duration,
#  * including:
#  * - partial initialization
#  * - implicit type conversions
#  * - compound and single expressions as initializers
#  * - string literals as pointer and array initializers
#  * 

import "auto_struct_initializers"





pub fn get_double(none) f64 {
    return 2e12
}

#  case 1: fully initialized struct
pub fn test_full_initialization(none) i32 {
    full: struc s = $(        #  use string literals to initialize both pointers and arrays
        "I'm a struct!", "sup",         @full, #  initialize member with pointer to self
        get_double(), #  initialize member with result of function call
        @(full.four_d)#  initialize member with pointer to other member in
        #  self
        )

    return validate_full_initialization(@full)
}

#  case 2: partially initialized struct
pub fn test_partial_initialization(none) i32 {
    data msg: string = "Another string literal"
    partial: struc s = $(        msg, #  initialize member from variable
        $('a', 'b'), #  partially initialize array
        cast<*struc s>(calloc(        1,         sizeof<struc s>))#  initialize ptr with call to calloc
        #  don't initialize last element
        )

    return validate_partial_initialization(@partial, msg)
}

#  case 3: implicit type conversions for struct members
pub fn test_implicit_type_conversions(none) i32 {
    data i: i32 = 3000

    converted: struc s = $(        malloc(5), #  convert void * to char *
        $(i / 2, i / 3, i * 4), #  truncate ints to chars: 220, 232, and 224
        0l, #  convert null pointer constant to null pointer
        i - 1, #  convert int to double
        calloc(1, sizeof<f64>)#  convert void * to double *
        )

    return validate_converted(@converted)
}

#  case 4: initialize with single expression instead of compound initiailizer
pub fn test_single_exp_initializer(none) i32 {
    d: f64 = 123.4
    s1: struc s = $("Yet another string", "xy", @s1, 150.0, @d)
    s2: struc s = s1

    return validate_two_structs(@s1, @s2)
}

pub fn main(none) i32 {
    if not test_full_initialization() {
        return 1
    }

    if not test_partial_initialization() {
        return 2
    }

    if not test_implicit_type_conversions() {
        return 3
    }

    if not test_single_exp_initializer() {
        return 4
    }

    return 0 #  success
}
