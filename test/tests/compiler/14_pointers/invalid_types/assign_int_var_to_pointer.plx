pub fn main(none) i32 {
    x: i32 = 0
    #  It's illegal to initialize pointer with value of type int
    #      * Note that x isn't a null pointer constant, because it's not a constant,
    #      * even though its value is 0 
    ptr: *i32 = x
}
