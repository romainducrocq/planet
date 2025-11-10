pub fn add(a: i32, b: i32) i64 {
    return cast<i64>(a) + cast<i64>(b)
}

pub fn main(none) i32 {
    a: i64 = add(2147483645, 2147483645)
    #  Test returning a long from a function call 
    if a == 4294967290l {
        return 1
    }
    return 0
}
