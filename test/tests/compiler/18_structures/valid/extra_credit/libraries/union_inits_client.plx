#  Test initialization of unions with automatic storage duration

import `union_inits`








pub fn test_simple(none) i32 {
    #  initialize simple union w/ only scalar members
    x: union simple = $(123.45)
    return validate_simple(@x)
}

pub fn test_simple_converted(none) i32 {
    #  initialize simple union where value of element is implicitly converted
    #  to target type (in this case the nearest representatble double,
    #  18446744073709549568.0)
    x: union simple = $(18446744073709550315ul)
    return validate_simple_converted(@x)
}


pub fn test_nested(none) i32 {
    #  initalize nested union where first member is a structure
    x: union nested = $($(4294967395l, $($(-1, -2, -3, -4, -5, -6, -7, -8, -9))))
    return validate_nested(@x)
}

pub fn test_nested_partial_init(none) i32 {
    #  initialize union where inner subobject is a partly initialized struct
    x: union nested = $($(9000372036854775800l, $("string")))
    return validate_nested_partial(@x)
}

pub fn main(none) i32 {
    if not test_simple() {
        return 1
    }

    if not test_simple_converted() {
        return 2
    }

    if not test_nested() {
        return 3
    }

    if not test_nested_partial_init() {
        return 4
    }

    return 0
}
