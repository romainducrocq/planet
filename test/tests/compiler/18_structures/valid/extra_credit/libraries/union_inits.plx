#  Test initialization of unions with both automatic and static storage duration

import `union_inits`

pub fn validate_simple(ptr: *union simple) i32 {
    return (ptr[].d == 123.45)
}

pub fn validate_simple_converted(ptr: *union simple) i32 {
    return (ptr[].d == 18446744073709549568.)
}

pub fn validate_nested(ptr: *union nested) bool {
    if ptr[].str.l ~= 4294967395l {
        return 0 #  fail
    }

    loop i: i32 = 0 while i < 9 .. i = i + 1 {
        if ptr[].str.u.arr[i] ~= -1 - i {
            return 0 #  fail
        }
    }

    return 1 #  success
}
pub fn validate_nested_partial(ptr: *union nested) i32 {
    if ptr[].str.l ~= 9000372036854775800l {
        return 0 #  fail
    }

    if strcmp(ptr[].str.u.arr, "string") {
        return 0 #  fail
    }

    return 1 #  success
}
