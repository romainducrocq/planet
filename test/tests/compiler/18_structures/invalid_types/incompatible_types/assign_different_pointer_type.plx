type struc s1;
type struc s2;

pub fn main(none) i32 {
    p1: *struc s1 = 0
    p2: *struc s2 = 0
    p2 = p1 #  can't assign to struct s2 * from struct s1 *
    return nil
}
