#  Test conversions from double to the signed integer types 

pub fn double_to_int(d: f64) i32 {
    return cast<i32>(d)
}

pub fn double_to_long(d: f64) i64 {
    return cast<i64>(d)
}

pub fn main(none) i32 {

    #  when truncated, d will fit in a long
    #  but not an int
    l: i64 = double_to_long(2148429099.3)
    #  should be truncated towards 0
    if l ~= 2148429099l {
        return 1
    }

    i: i32 = double_to_int(-200000.9999)
    #  negative value should be truncated towards 0
    if i ~= -200000 {
        return 2
    }

    return 0
}
