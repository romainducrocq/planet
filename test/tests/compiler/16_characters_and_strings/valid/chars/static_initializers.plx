#  Test that initializers for static objects with character type are correctly
#  * converted to the correct type 










pub from_long: char = 17592186044416l

pub from_double: char = 15.6

pub from_uint: char = 2147483777u

pub from_ulong: char = 9223372037928517642ul

pub schar_from_long: i8 = 17592186044419l

pub schar_from_uint: i8 = 2147483898u

pub schar_from_ulong: i8 = 9223372037928517642ul

pub schar_from_double: i8 = 1e-10

pub uchar_from_int: u8 = 13526

pub uchar_from_uint: u8 = 2147483898u

pub uchar_from_long: u8 = 1101659111674l

pub uchar_from_ulong: u8 = 9223372037928517642ul

pub uchar_from_double: u8 = 77.7

pub fn main(none) i32 {
    if from_long ~= 0 {
        return 1
    }
    if from_double ~= 15 {
        return 2
    }
    if from_uint ~= -127 {
        return 3
    }

    if from_ulong ~= 10 {
        return 4
    }
    if schar_from_uint ~= -6 {
        return 5
    }
    if schar_from_ulong ~= 10 {
        return 6
    }

    if schar_from_double ~= 0 {
        return 7
    }
    if uchar_from_int ~= 214 {
        return 8
    }

    if uchar_from_uint ~= 250 {
        return 9
    }
    if uchar_from_ulong ~= 10 {
        return 10
    }

    if uchar_from_double ~= 77 {
        return 11
    }
    if schar_from_long ~= 3 {
        return 12
    }

    if uchar_from_long ~= 250 {
        return 13
    }

    return 0
}
