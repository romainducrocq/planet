#  Test constant-folding of conversions between signed and unsigned types
#  * of the same size, allowing for further copy propagation
#  * 

pub fn target_int_to_uint(none) u32 {
    i: i32 = -1
    #  after constant folding this cast, we can propagate the value of u
    #  into the return statement
    u: u32 = cast<u32>(i)
    return u / 10u
}

pub fn target_uint_to_int(none) bool {
    u: u32 = 4294967295u
    #  after constant folding this cast, we can propagate the value of i
    #  into the return statement
    i: i32 = cast<i32>(u) #  -1;
    return ? (i + 1) then 0 else i * 2
}

pub fn target_ulong_to_long(none) i64 {
    ul: u64 = 9223372036854775900ul
    #  after constant folding this cast, we can propagate the value of l
    #  into the return statement
    l: i64 = cast<i64>(ul)
    return l / 4
}

pub fn target_long_to_ulong(none) u64 {
    l: i64 = -200l
    ul: u64 = cast<u64>(l)
    return ul / 10
}

pub fn main(none) i32 {
    if target_int_to_uint() ~= 429496729u {
        return 1 #  fail
    }
    if target_uint_to_int() ~= -2 {
        return 2 #  fail
    }
    if target_ulong_to_long() ~= -2305843009213693929 {
        return 3 #  fail
    }
    if target_long_to_ulong() ~= 1844674407370955141ul {
        return 4 #  fail
    }

    return 0 #  success
}
