#  Make sure we can implicity convert null pointer constants to pointer type 

#  convert static variable initializers
pub d: *f64 = 0l
pub i: *i32 = 0ul
pub i2: *i32 = 0u

pub fn expect_null_param(val: *i32) i32 {
    #  validate that this is a null pointer
    return (val == 0ul)
}

pub fn return_null_ptr(none) *i64 {
    return 0 #  convert return value to pointer
}

pub fn main(none) i32 {
    x: i32 = 10
    ptr: *i32 = @x

    #  check static initializers
    if d {
        return 1
    }

    if i {
        return 2
    }
    if i2 {
        return 3
    }

    #  convert to pointer for assignment
    ptr = 0ul
    if ptr {
        return 4
    }

    #  convert pointer in non-static initializer
    y: *i32 = 0
    if y ~= 0 {
        return 5
    }

    #  convert function argument to pointer
    if not expect_null_param(nil) {         return 6
    }

    #  return_null_ptr converts a null pointer constant to a pointer
    null_ptr: *i64 = return_null_ptr()
    if null_ptr ~= 0 {         return 7
    }

    #  convert ternary operand to null pointer
    ptr = @x #  now pointer is non-null
    ternary_result: *i32 = ? 10 then 0 else ptr
    if ternary_result {
        return 8
    }

    return nil
}
