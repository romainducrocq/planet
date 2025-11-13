#  A pointer to a string can only be assigned to a pointer to an array
#  * with the correct length. 

pub fn main(none) i32 {
    #  &"x" has type char (*)[2],
    #  so it can't initialize a variable of type char (*)[10]
    string_pointer: *[10]char = @"x"
    return 0
}
