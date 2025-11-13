pub fn main(none) i32 {
    arr: [10]i32;
    #  It's illegal to compare these expressions because
    #      * they have different types: arr is converted to type int *,
    #      * while &arr will have type int (*)[10]
    #      
    return arr == @arr
}
