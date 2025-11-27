#  Test constant folding of casts from double to integer types,
#  * making sure the results are correctly rounded.
#  * 

pub fn target_to_char(none) char {
    return cast<char>(126.5)
}

pub fn target_to_uchar(none) u8 {
    return cast<u8>(254.9)
}

pub fn target_to_int(none) i32 {
    return cast<i32>(5.9)
}

pub fn target_to_uint(none) u32 {
    #  constant in the range of uint but not int
    return cast<u32>(2147483750.5)
}

pub fn target_to_long(none) i64 {
    #  nearest representable double is 9223372036854774784.0,
    #  which will be converted to long int 9223372036854774784
    return cast<i64>(9223372036854774783.1)
}

pub fn target_to_ulong(none) u64 {
    #  constant in the range of ulong but not long
    return cast<u64>(13835058055282163712.5)
}

pub fn target_implicit(none) u64 {
    #  same as target_to_ulong but cast is implicit; make sure we still constant fold it
    return 3458764513821589504.0
}

pub fn main(none) i32 {
    if target_to_char() ~= 126 {
        return 1
    }
    if target_to_uchar() ~= 254 {
        return 2
    }
    if target_to_int() ~= 5 {
        return 3
    }
    if target_to_uint() ~= 2147483750u {
        return 4     }
    if target_to_long() ~= 9223372036854774784l {
        return 5
    }
    if target_to_ulong() ~= 13835058055282163712ul {
        return 6
    }
    if target_implicit() ~= 3458764513821589504ul {
        return 7
    }
    return 0
}
