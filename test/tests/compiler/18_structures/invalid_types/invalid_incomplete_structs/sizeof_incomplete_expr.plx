type struc s;
pub fn get_ptr(none) *struc s;

pub fn main(none) i32 {
    struct_ptr: *struc s = get_ptr()

    #  can't apply sizeof to expression w/ incomplete type
    return sizeof(struct_ptr[])
}
