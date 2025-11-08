pub fn main(none) i32 {
    a: i32 = 1
    #  b has static storage duration,
    #      * so its initializer must be constant.
    #      
    data b: i32 = a * 2
    return b
}
