type struc s;

extrn foo: struc s;

pub fn main(none) i32 {
    return foo.a #  can't get member of incomplete structure type
}
