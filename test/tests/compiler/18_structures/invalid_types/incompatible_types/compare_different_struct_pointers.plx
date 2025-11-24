type struc s1;
type struc s2;

pub fn get_s1_ptr(none) *struc s1;
pub fn get_s2_ptr(none) *struc s2;

pub fn main(none) i32 {
    #  can't compare pointers to two distinct struct types
    s1_ptr: *struc s1 = get_s1_ptr()
    s2_ptr: *struc s2 = get_s2_ptr()
    return s1_ptr == s2_ptr
}
