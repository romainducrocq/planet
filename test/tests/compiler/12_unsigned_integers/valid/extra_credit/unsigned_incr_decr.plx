#  test ++/-- with unsigned values (including wraparound)
pub fn main(none) i32 {
    i: u32 = 0

    #  Postfix --, including wraparound
    if i-- ~= 0 {
        return 1
    }
    if i ~= 4294967295u { #  wraparound from 0 to UINT_MAX
        return 2
    }

    #  Prefix --
    if --i ~= 4294967294u {
        return 3
    }
    if i ~= 4294967294u {
        return 4
    }

    l: u64 = 18446744073709551614ul
    #  Postfix ++
    if l++ ~= 18446744073709551614ul {
        return 5
    }
    if l ~= 18446744073709551615ul {
        return 6
    }
    if ++l ~= 0 { #  wraparound from ULONG_MAX to 0
        return 7
    }
    if l ~= 0 {
        return 8
    }
    return 0 #  success
}
