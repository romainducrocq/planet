#  Test explicitly casting between pointer types 

pub fn check_null_ptr_cast(none) i32 {
    #  You can cast a null pointer to any pointer type and the result is still a null pointer 
    data long_ptr: *i64 = 0 #  make this static so we don't optimize away this function
    dbl_ptr: *f64 = cast<*f64>(long_ptr)
    int_ptr: *u32 = cast<*u32>(long_ptr)
    ptr_ptr: **bool = cast<**i32>(long_ptr)

    if long_ptr {
        return 1
    }
    if dbl_ptr {
        return 2
    }
    if int_ptr {
        return 3
    }
    if ptr_ptr {
        return 4
    }
    return 0
}

pub fn check_round_trip(none) i32 {
    #  conversions between pointer types should round trip
    #      * Note that conversions between pointer types are undefined if
    #      * result is misaligned for the new type; in this case,
    #      * we're only dealing with pointers to 8 byte-aligned types so it's not a problem
    #      
    l: i64 = -1
    long_ptr: *i64 = @l
    dbl_ptr: *f64 = cast<*f64>(long_ptr)
    other_long_ptr: *i64 = cast<*i64>(dbl_ptr)
    if other_long_ptr[] ~= -1 {
        return 5
    }
    return 0
}

pub fn main(none) bool {
    result: i32 = check_null_ptr_cast(
        )

    #  non-zero result indicates a problem
    if result {
        return result
    }

    result = check_round_trip()
    return result }
