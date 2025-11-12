pub fn main(none) i32 {
    #  It's illegal to initializer a pointer with any integer
    #      * other than a null pointer constant
    #      * even if it might be a valid memory address
    #      
    ptr: *i32 = 140732898195768ul
    return 0
}
