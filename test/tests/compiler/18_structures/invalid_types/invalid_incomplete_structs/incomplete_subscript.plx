type struc s;
extrn ptr: *struc s;

#  can't subscript a pointer to an incomplete type
#  this is equivalent to dereferencing a pointer to an incomplete type
pub fn main(none) i32 {
    ptr[0]
}
