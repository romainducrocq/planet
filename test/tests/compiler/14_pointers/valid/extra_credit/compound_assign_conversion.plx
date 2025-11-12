#  Test compound assignment through pointers involving type conversions

pub fn main(none) i32 {
    #  lval is pointer
    d: f64 = 5.0
    d_ptr: *f64 = @d
    #  convert 1000 to double
    d_ptr[] *= 1000u
    if d ~= 5000.0 {
        return 1 #  fail
    }
    i: i32 = -50
    i_ptr: *i32 = @i
    #  convert *i_ptr to unsigned, perform operation, then convert back
    i_ptr[] %= 4294967200u
    if i_ptr[] ~= 46 {
        return 2 #  fail
    }

    #  rval is pointer
    ui: u32 = 4294967295u #  2^32 - 1
    ui /= d_ptr[]
    #  convert ui to double, perform operation, and convert back
    if ui ~= 858993u {
        return 3 #  fail
    }

    #  both operands are pointers
    i = -10
    ul: u64 = 9223372036854775807ul #  2^63 - 1
    ul_ptr: *u64 = @ul
    #  convert i to common type (ul), perform operation, then
    #  convert back to int
    i_ptr[] -= ul_ptr[]
    if i ~= -9 {
        return 4 #  fail
    }

    #  check neighbors
    if ul ~= 9223372036854775807ul {
        return 5 #  fail
    }

    return 0
}
