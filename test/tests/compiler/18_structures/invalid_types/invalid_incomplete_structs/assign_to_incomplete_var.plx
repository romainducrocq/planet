type struc s;

extrn x: struc s;
extrn y: struc s;

pub fn main(none) i32 {
    x = y #  can't assign to or from variable with incomplete type
    return 0
}
