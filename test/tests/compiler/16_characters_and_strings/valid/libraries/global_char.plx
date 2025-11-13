pub c: char = 100
pub uc: u8 = 250
pub sc: i8 = 0

pub fn update_global_chars(none) i32 {
    c = c + 10
    uc = uc + 10 #  wraps around
    sc = sc - 10
    return 0
}
