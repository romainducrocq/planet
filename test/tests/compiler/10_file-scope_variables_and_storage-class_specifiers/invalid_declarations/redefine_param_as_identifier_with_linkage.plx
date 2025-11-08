pub fn f(i: i32) i32 {
    #  Can't declare the same identifier in the same scope both with and
    #      * without linkage. (The parameter and variable i in this program
    #      * are in the same scope.) 
    extrn i: i32;
    return i
}

pub fn main(none) i32 {
    return 0
}
