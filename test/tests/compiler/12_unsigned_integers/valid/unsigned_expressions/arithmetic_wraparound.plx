#  Test that unsigned arithmetic operations wrap around 

pub ui_a: u32;
pub ui_b: u32;

pub ul_a: u64;
pub ul_b: u64;

pub fn addition(none) i32 {
    #  ui_a = UINT_MAX - 2
    #  ui_b = 3
    #  result wraps around to 0
    return ui_a + ui_b == 0u
}

pub fn subtraction(none) i32 {
    #  ul_a = 10
    #  ul_b = 20
    #  ul_a - ul_b wraps around to 2^64 - 10 
    return (ul_a - ul_b == 18446744073709551606ul)
}

pub fn neg(none) i32 {
    #  ul_a = 1ul
    #  negating this wraps around to 2^64 - 1, or ULONG_MAX
    return -ul_a == 18446744073709551615ul
}

pub fn main(none) i32 {
    ui_a = 4294967293u
    ui_b = 3u
    if not addition() {
        return 1
    }

    ul_a = 10ul
    ul_b = 20ul
    if not subtraction() {
        return 2
    }

    ul_a = 1ul
    if not neg() {
        return 3
    }

    return 0

}
