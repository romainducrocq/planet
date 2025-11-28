type union u1(x1: u64, arr1: [3]u8)
type union u2(x2: u64, arr2: [3]u8)

pub fn main(none) i32 {
    u: union u1 = $(255ul)

    cast<union u2>(u).arr2[0] = 255
    return 0
}
