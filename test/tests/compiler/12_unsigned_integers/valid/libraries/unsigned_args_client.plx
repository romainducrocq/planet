#  make sure we pass (and if needed, type convert) unsigned args correctly 
pub fn accept_unsigned(a: u32, b: u32, c: u64, d: u64, e: u32, f: u32, g: u64, h: u32, i: u64) i32;



pub fn main(none) i32 {
    return accept_unsigned(1, -
        1, -
        1, 9223372036854775808ul, 2147483648ul, false, 123456, 2147487744u, 9223372041149743104ul)
}
