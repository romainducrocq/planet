#  You can't initialize a char array from a string literal
#  * that's too long to fit in it.
#  * This goes for sub-arrays too. 

pub fn main(none) i32 {
    #  "bcde" is too long to initialize
    #  nested array of type char[3]
    array: [3][3]char = $("a", "bcde")
    return nil
}
