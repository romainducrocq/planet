#  Test constant folding of all conversions from longer to shorter integer
#  * types. For now, we just verify that the behavior is correct, without
#  * inspecting the assembly code; we can't tell whether a truncate operation was
#  * constant folded because it turns into a single 'mov' instruction either way.
#  * The whole_pipeline/ folder has more robust tests for constant folding of
#  * truncate operations - in these tests, constant-folding truncate enables
#  * other optimizations.
#  









#  truncate long
pub fn long_to_int(none) i32 {
    #  2^45 + 2^35 + 1234
    return cast<i32>(35218731828434l)
}

pub fn long_to_uint(none) u32 {
    #  2^45 + 2^35 + 1234
    return cast<u32>(35218731828434l)
}

pub fn long_to_char(none) char {
    #  LONG_MAX
    return cast<char>(9223372036854775807l)
}

pub fn long_to_schar(none) i8 {
    #  2^62 + 128
    return cast<i8>(4611686018427388032l)
}

pub fn long_to_uchar(none) u8 {
    #  UINT_MAX
    return cast<u8>(4294967295ul)
}

#  truncate unsigned long
pub fn ulong_to_int(none) i32 {
    #  ULONG_MAX
    return cast<i32>(18446744073709551615ul)
}

pub fn ulong_to_uint(none) u32 {
    return cast<u32>(18446744073709551615ul)
}

pub fn ulong_to_char(none) char {
    return cast<char>(4294967295ul)
}

pub fn ulong_to_schar(none) i8 {
    return cast<i8>(4611686018427388032ul)
}

pub fn ulong_to_uchar(
    none) u8 {
    #  2^63 + 255
    return cast<u8>(9223372036854776063ul)
}

#  truncate int
pub fn int_to_char(none) char {
    return cast<char>(1274)
}

pub fn int_to_schar(none) i8 {
    #  INT_MAX
    return cast<i8>(2147483647)
}

pub fn int_to_uchar(none) u8 {
    return cast<u8>(1274)
}

#  truncate unsigned int
pub fn uint_to_char(none) char {
    return cast<char>(2147483901u) #  2^31 + 253
}

pub fn uint_to_schar(none) i8 {
    return cast<i8>(2147483660u) #  2^31 + 12
}

pub fn uint_to_uchar(none) u8 {
    return cast<u8>(2147483901u)
}

#  same as uint_to_uchar but implicit cast
pub fn implicit(none) u8 {
    return 2147483901u
}

pub one: i32 = true
pub six: i32 = 6
pub three: i32 = 3
pub one_twenty_eight: i32 = 128

pub fn main(none) i32 {
    #  truncate longs

    #  0x0000_2008_0000_04d2 --> 0x0000_04d2
    if long_to_int() ~= 1234 {
        return 1
    }
    if long_to_uint() ~= 1234u {
        return 2
    }

    #  0x7fff_ffff_ffff_ffff --> 0xff
    if long_to_char() ~= -one {
        return 3
    }

    #  0x4000_0000_0000_0080 --> 0x80
    if long_to_schar() ~= -one_twenty_eight {
        return 4
    }

    #  0x0000_0000_ffff_ffff -> 0xff
    if long_to_uchar() ~= 255 {
        return 5
    }

    #  truncate ulongs

    #  0xffff_ffff_ffff_ffff --> 0xffff_ffff
    if ulong_to_int() ~= -one {
        return 6
    }
    if ulong_to_uint() ~= 4294967295u {
        return 7
    }

    #  0x7fff_ffff_ffff_ffff --> 0xff
    if ulong_to_char() ~= -one {
        return 8
    }

    #  0x4000_0000_0000_0080 --> 0x80
    if ulong_to_schar() ~= -one_twenty_eight {
        return 9
    }

    #  0x0000_0000_ffff_ffff -> 0xff
    if ulong_to_uchar() ~= 255 {
        return 10
    }

    #  truncate ints

    #  0x0000_04fa -> 0xfa
    if int_to_char() ~= -six {
        return 11
    }

    #  0x7fff_ffff -> 0xff
    if int_to_schar() ~= -one {
        return 12
    }

    #  0x0000_04fa -> 0xfa
    if int_to_uchar() ~= 250 {
        return 13
    }

    #  truncate uints

    #  0x8000_00fd --> 0xfd
    if uint_to_char() ~= -three {
        return 14
    }

    #  0x8000_000c -> 0x0c
    if uint_to_schar() ~= 12 {
        return 15
    }
    #  0x8000_00fd --> 0xfd
    if uint_to_uchar() ~= 253 {
        return 16
    }
    if implicit() ~= 253 {
        return 17
    }
    return 0
}
