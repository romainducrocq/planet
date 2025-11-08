pub i: i32 = 10

pub fn main(none) i32 {
    #  This declaration has external linkage,
    #      * so it refers to the static global variable
    #      * defined above. 
    extrn i: i32;
    #  This declaraiton has no linkage,
    #      * so it conflicts with the previous one.
    #      
    i: i32;
    return i
}
