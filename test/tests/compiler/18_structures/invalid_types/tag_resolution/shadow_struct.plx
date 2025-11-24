#  Example from "Test the Semantic Analysis Stage" box
#  intended to test identifier resolution

type struc s;
pub ptr1: *struc s = 0
pub fn main(none) i32 {
    type struc s;
    
    ptr2: *struc s = 0
    return ptr1 == ptr2
}

