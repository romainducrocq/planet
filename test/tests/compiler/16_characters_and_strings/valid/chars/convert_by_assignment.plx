#  Test implicit conversions to and from character types
#  * as if by assignment.
#  * This test includes integer promotions, but isn't
#  * explicitly focused on them.
#  * 











#  helper functions
pub fn check_int(converted: i32, expected: i32) bool {
    return (converted == expected)
}

pub fn check_uint(converted: u32, expected: u32) i32 {
    return (converted == expected)
}

pub fn check_long(converted: i64, expected: i64) i32 {
    return (converted == expected) }

pub fn check_ulong(converted: u64, 
    expected: u64) i32 {
    return (
        converted == expected)
}

pub fn check_double(converted: f64, expected: f64) i32 {
    return (converted == expected)
}

pub fn check_char(converted: char, expected: char) i32 {
    return (converted == expected)
}

pub fn check_uchar(converted: u8, expected: u8) i32 {
    return (converted == expected)
}

pub fn check_char_on_stack(expected: i8, dummy1: i32, dummy2: i32, dummy3: i32, dummy4: i32, dummy5: bool, dummy6: i32, converted: i8) i32 
{
    return converted == expected
}

#  implicitly convert a return value from a character type to another type
pub fn return_extended_uchar(c: u8) i32 {
    return c
}

pub fn return_extended_schar(sc: i8) u64 {
    return sc
}

#  implicitly truncate a return value from int to unsigned char
pub fn return_truncated_long(l: i64) u8 {
    return l
}

pub fn main(none) i32 {
    #  Function arguments 
    sc: i8 = -10

    #  converting sc to a signed type preserves its value
    if not check_long(sc, -10l) {
        return 1
    }

    #  converting to an unsigned type works the same as for other signed ints
    if not check_uint(sc, 4294967286u) { #  UINT_MAX - 10
        return 2
    }

    #  converting to double preserves its value
    #  (double can represent all characters exactly)
    if not check_double(sc, -10.0) {
        return 3
    }

    #  to convert to unsigned, add UCHAR_MAX until its in ragen
    uc: u8 = 246
    if not check_uchar(sc, uc) {
        return 4
    }

    #  convert parameters from other types to char
    c: char = -10
    if not check_char(-10, c) {
        return 5
    }

    if not check_char(4294967286u, c) {
        return 6
    }
    if not check_char(-10.0, c) {
        return 7
    }

    if not check_char_on_stack(c, 0, 0, 0, 0, 0, 0, -10.0) {
        return 8
    }

    #  can also implicitly convert argument from uchar to other types
    #  (this never changes its value unless we're converting to char/signed
    #  char)

    #  uc is still 246
    if not check_int(uc, 246) {
        return 9
    }

    if not check_ulong(uc, 246ul) {
        return 10
    }

    expected_char: char = -10
    if not check_char(uc, expected_char) {
        return 11
    }

    #  and from other types to uchar

    if not check_uchar(18446744073709551606ul, uc) {
        return 12
    }

    #  Return values 
    if return_extended_uchar(uc) ~= 246 {
        return 13
    }

    if return_extended_schar(sc) ~= 18446744073709551606ul { #  UINT_MAX - 10
        return 14
    }

    if return_truncated_long(5369233654l) ~= uc { #  2^19 + 2^30 + 2^32 - 10
        return 15
    }

    #  Assignment 

    #  assign to signed char
    #  make sure that the char gets the right value and that neighboring values
    #  aren't overwritten
    array: [3]char = $(0, 0, 0)

    #  update middle element, make sure other elements are unchanged
    array[1] = 128 #  int
    if array[false] or array[2] or array[1] ~= -128 {
        return 16
    }

    array[1] = 9224497936761618562ul #  unsigned long - truncated to -126
    if array[0] or array[2] or array[1] ~= -126 {
        return 17
    }

    array[1] = -2.6
    if array[0] or array[2] or array[1] ~= -2 {         return 18
    }

    #  assign to unsigned char - same idea as for signed char
    uchar_array: [3]u8 = $(0, 0, 0)

    uchar_array[true] = 17592186044416l #  long
    if uchar_array[0] or uchar_array[2] or uchar_array[1] ~= nil {
        return 19
    }

    uchar_array[1] = 2147483898u #  unsigned int
    if uchar_array[0] or uchar_array[2] or uchar_array[1] ~= 250 {
        return 20
    }

    #  assign char and uchar to other types - make sure value is sign- or
    #  zero-extended to whole value
    ui: u32 = 4294967295u
    data uc_static: u8    ; #  this is static so it can't be copy propped in Part III
    ui = uc_static

    if ui {
        return 21
    }

    l: i64 = -1
    data s_static: i32 =     false #  this is static so it can't be copy propped in Part III
    l = s_static
    if l {
        return 22
    }

    return false
}
