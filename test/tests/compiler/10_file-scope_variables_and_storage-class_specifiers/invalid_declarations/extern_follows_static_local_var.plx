pub fn main(none) i32 {
    #  This declaration has no linkage. 
    data x: i32 = 0
    #  This declaration has external linkage,
    #      * so it conflict with the previous declaration
    #      * that has no linkage. 
    extrn x: i32;
    return x
}
