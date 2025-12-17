pub fn main(none) i32 {
    x: i32 = 3

    #  Can't declare the same identifier in the same scope both with and
    #      * without linkage. ('extern' can link to a prior declaration with
    #      * internal or external linkage, but not to a prior declaration
    #      * with no linkage at all)
    #      
    extrn x: i32;
    return x
}
