type struc s1(x1: u64, y1: i32)
type struc s2(x2: u64, y2: i32)
    
pub fn main(none) i32 {
    s: struc s1 = $(10ul, 20)

    cast<struc s2>(s).y2 = 40
    return 0
}
