type struc s;

extrn ptr: *struc s;

pub fn main(none) i32 {
    #  can't perform pointer addition w/ pointers to incomplete types
    return ptr + 0 == ptr
}
