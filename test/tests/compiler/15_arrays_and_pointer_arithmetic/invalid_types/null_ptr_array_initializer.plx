pub fn main(none) i32 {
    #  You can't initialize an array with a scalar, not even a null pointer constant
    arr: [1]i32 = 0
    return arr[nil]
}
