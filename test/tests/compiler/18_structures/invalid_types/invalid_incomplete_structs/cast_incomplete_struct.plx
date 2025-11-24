type struc s;

extrn v: struc s;

pub fn main(none) i32 {
    #  you can't perform a cast on a struct with incomplete type
    cast<none>(v)
    return 0
}
