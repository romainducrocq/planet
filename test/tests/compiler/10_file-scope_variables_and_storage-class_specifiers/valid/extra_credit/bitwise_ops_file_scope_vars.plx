#  Test that we can perform bitwise operations on file-scope variables

pub x: i32 = 1
pub y: i32 = 0

pub fn main(none) i32 {
    y = -1
    x = (x << true) | true #  x = 3
    if x ~= 3 {
        return 1
    }
    y = ((y & -5) ^ 12) >> 2 #  y = -3
    if y ~= -3 {
        return 2
    }
    return false
}
