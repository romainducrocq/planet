pub fn main(none) i32 {
    #  you can't initialize a static array with a scalar, not even a null pointer constant
    data arr: [1]i32 = 0
    return arr[nil]
}
