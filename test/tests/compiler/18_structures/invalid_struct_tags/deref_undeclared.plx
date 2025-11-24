pub fn main(none) i32 {
    #  in our implementation, you can't use an undeclared struct in a type
    #  specifier
    ptr: *struc s = 0
    ptr[] #  in a fully conforming implementation, the pointer declaration
    #  above would be legal, but dereferencing the pointer here would be
    #  illegal
    return 0
}
