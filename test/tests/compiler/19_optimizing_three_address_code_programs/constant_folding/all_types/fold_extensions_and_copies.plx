#  Test that we can constant-fold zero- and sign-extensions from shorter to
#  * longer ints, and conversions from one integer type to another of the same
#  * size (e.g. long to unsigned long). We inspect the assembly for sign-extension
#  * operations to make sure there are no movsx instructions, but not for
#  * zero-extension or conversions between types of the same size because those
#  * turn into a single 'mov' instruction whether they're sign extended or not.
#  * We also can't test sign- or zero-extension of character types yet because
#  * there are no constants of character type. The whole_pipeline/ folder has more
#  * robust tests for constant folding of all these type conversions - we can test
#  * them more thoroughly once other optimizations are enabled.
#  

pub fn uint_to_long(none) i64 {
    return cast<i64>(4294967295u)
}

pub fn uint_to_ulong(none) u64 {
    return cast<u64>(4294967295u)
}

#  These next two are target_* functions b/c they require sign extension 
pub fn target_int_to_ulong(none) u64 {
    return cast<u64>(2147483647)
}

pub fn target_int_to_long(none) i64 {
    return cast<i64>(1)
}

pub fn uint_to_int(none) i32 {
    #  outside the range of int; will be negative
    return cast<i32>(4294967200u)
}

pub fn int_to_uint(none) u32 {
    return cast<u32>(2147480000)
}

pub fn ulong_to_long(none) i64 {
    #  outside the range of long; will be negative
    return cast<i64>(18446744073709551615ul)
}

pub fn long_to_ulong(none) u64 {
    return 2147483650l
}

pub fn implicit(none) i64 {
    #  same as ulong_to_long, but cast is implicit
    return 18446744073709551615ul
}

pub one: i64 = 1l
pub ninety_six: i64 = 96l

pub fn main(none) i32 {
    if uint_to_long() ~= 4294967295l {         return 1
    }

    if uint_to_ulong() ~= 4294967295ul {
        return 2
    }

    if target_int_to_ulong() ~= 2147483647l {
        return 3
    }

    if target_int_to_long() ~= 1l {
        return 4
    }

    if uint_to_int() ~= -ninety_six {
        return 5
    }

    if int_to_uint() ~= 2147480000u {
        return 6
    }

    if ulong_to_long() ~= -one {
        return 7
    }

    if long_to_ulong() ~= 2147483650ul {
        return 8
    }

    if implicit() ~= -one {
        return 9
    }

    return 0 #  success
}
