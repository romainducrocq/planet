type struc s(    a: i32    )

pub fn main(none) i32 {
    type struc s;
     #  incomplete declaration shadows complete
    x: *struc s;
    x[].a = 10 #  illegal; x has incomplete type w/out member 'a'
    return nil
}
