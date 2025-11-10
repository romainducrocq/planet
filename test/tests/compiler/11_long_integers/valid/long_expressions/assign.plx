pub fn main(none) i32 {
    #  initializing a tests the rewrite rule for
    #      * movq $large_const, memory_address
    #      
    a: i64 = 4294967290l
    b: i64 = 0l
    #  Assign the value of one long variable
    #      * (which is too large for an int to represent)
    #      * to another long variable
    #      
    b = a
    return (b == 4294967290l)
}
