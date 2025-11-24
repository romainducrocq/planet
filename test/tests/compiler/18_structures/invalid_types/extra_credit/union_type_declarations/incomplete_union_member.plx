#  You can't declare a union with an incomplete member type 
type struc s;
type union u(    bad_struct: struc s    )

pub fn main(none) i32 {
    return nil
}
