pub fn foo(p: i32) i32 {
    #  Because arr has static storage duration,
    #  the initializer for each element must be a constant
    data arr: [3]i32 = $(p, p + 1, 0)
    return arr[2]
}

pub fn main(none) i32 {
    return foo(5)
}
