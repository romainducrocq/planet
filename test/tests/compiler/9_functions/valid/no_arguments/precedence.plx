pub fn three(none) i32 {
    return 3
}

pub fn main(none) i32 {
    #  The function call operator () is higher precedence
    #      * than unary prefix operators
    #      
    return not three()
}
