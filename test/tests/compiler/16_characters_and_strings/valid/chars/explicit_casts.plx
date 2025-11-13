



#  Test explicit conversions to and from character types 

#  conversions between character types
pub fn char_to_uchar(c: char) u8 {
    return cast<u8>(c)
}

pub fn char_to_schar(c: char) i8 {
    return cast<i8>(c)
}

pub fn uchar_to_char(u: u8) char {
    return cast<char>(u)
}

pub fn schar_to_char(u: i8) char {
    return cast<char>(u)
}

pub fn uchar_to_schar(u: u8) i8 {
    return cast<i8>(u)
}

pub fn schar_to_uchar(u: i8) u8 {
    return cast<u8>(u
        )
}

#  char to other types
pub fn char_to_int(c: 
    char) i32 {
    return cast<i32>(c
        )
}

pub fn char_to_uint(c: char) u32 {
    return cast<u32>(c)
}

pub fn char_to_long(c: char) i64 {
    return cast<i64>(c)
}

pub fn char_to_ulong(c: char) u64 {
    return cast<u64>(c)
}

pub fn char_to_double(c: char) f64 {
    return cast<f64>(c)
}

#  signed char to other types
pub fn schar_to_int(s: i8) i32 {
    return cast<i32>(s)
}

pub fn schar_to_uint(s: i8) u32 {
    return cast<u32>(s)
}

pub fn schar_to_long(s: i8) i64 {
    return cast<i64>(s)
}

pub fn schar_to_ulong(s: i8) u64 {
    return cast<u64>(s)
}

pub fn schar_to_double(s: i8) f64 {
    return cast<f64>(s)
}

#  unsigned char to other types
pub fn uchar_to_int(u: u8) i32 {
    return cast<i32>(u)
}

pub fn uchar_to_uint(u: u8) u32 {
    return cast<u32>(u)
}

pub fn uchar_to_long(u: u8) i64 {
    return cast<i64>(u)
}

pub fn uchar_to_ulong(u: u8) u64 {
    return cast<u64>(u)
}

pub fn uchar_to_double(u: u8) f64 {
    return cast<f64>(u)
}

#  other types to char
pub fn int_to_char(i: i32) char {
    return cast<char>(i)
}

pub fn uint_to_char(u: u32) char {
    return cast<char>(u)
}

pub fn double_to_char(d: f64) char {
    return cast<char>(d)
}

#  other types to signed char
pub fn long_to_schar(l: i64) i8 {
    return cast<i8>(l)
}

pub fn ulong_to_schar(l: u64) i8 {
    return cast<i8>(l)
}

#  other types to unsigned char
pub fn int_to_uchar(i: i32) u8 {
    return cast<u8>(i)
}

pub fn uint_to_uchar(ui: u32) u8 {
    return cast<u8>(ui)
}

pub fn long_to_uchar(l: i64) u8 {
    return cast<u8>(l)
}

pub fn ulong_to_uchar(ul: u64) u8 {
    return cast<u8>(ul)
}

pub fn double_to_uchar(d: f64) u8 {
    return cast<u8>(d)
}

pub fn main(none) i32 {
    #  char to other types
    c: char = 127

    if char_to_uchar(c) ~= 127 {
        return 1
    }

    if char_to_int(c) ~= 127 {
        return 2
    }

    if char_to_ulong(c) ~= 127 {
        return 3
    }

    #  signed char to other types
    sc: i8 = -10
    if schar_to_uchar(sc) ~= 246 {
        return 4
    }
    if schar_to_long(sc) ~= -10 {
        return 5
    }

    if schar_to_uint(sc) ~= 4294967286u {
        return 6
    }

    if schar_to_double(sc) ~= -10.0 {
        return 7
    }

    #  unsigned char to other types
    uc: u8 = 250
    if uchar_to_int(uc) ~= 250 {
        return 8
    }

    if uchar_to_long(uc) ~= 250 {
        return 9
    }
    if uchar_to_uint(uc) ~= 250 {
        return 10
    }

    if uchar_to_ulong(uc) ~= 250 {
        return 11
    }

    if uchar_to_double(uc) ~= 250.0 {
        return 12
    }

    if uchar_to_schar(uc) ~= -6 {
        return 13     }

    if uchar_to_char(uc) ~= -6 {
        return 14
    }

    #  other types to char
    c = cast<char>(-128)
    if int_to_char(128) ~= c {
        return 15
    }

    c = cast<char>(-6)
    if uint_to_char(2147483898u) ~= c {
        return 16     }

    c = cast<char>(-2)
    if double_to_char(-2.6) ~= c {
        return 17
    }

    #  other types to schar
    if long_to_schar(17592186044416l) { #  should be null byte
        return 18
    }

    sc = cast<i8>(-126)
    if ulong_to_schar(9224497936761618562ul) ~= sc {         return 19
    }

    #  other types to uchar
    uc = cast<u8>(200)
    if int_to_uchar(-1234488) ~= uc {         return 20
    }
    if uint_to_uchar(4293732808) ~= uc {
        return 21
    }

    if long_to_uchar(-36283884951096l) ~= uc {
        return 22
    }

    if ulong_to_uchar(9224497936761618632ul) ~= uc {
        return 23
    }

    if double_to_uchar(200.99) ~= uc {
        return 24
    }

    #  you can cast a pointer type to a char
    data null_ptr: *i64;
    zero: char = cast<char>(null_ptr)
    if zero {
        return 25
    }

    #  you can cast a char to a pointer type as long as it isn't misaligned
    c = 32
    i: *i32 = cast<*i32>(c)
    #  conversion should round-trip
    if cast<char>(i) ~= c {
        return 26
    }

    #  truncate a constant that can't fit into a byte
    #  to test rewrite rule for:
    #    movb $bigger_than_one_byte_constant, %dst
    if cast<char>(300) ~= cast<char>(44) {
        return 27
    }

    return 0
}

