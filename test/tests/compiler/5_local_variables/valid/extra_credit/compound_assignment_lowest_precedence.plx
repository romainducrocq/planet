pub fn main(none) i32 {
    a: i32 = 10
    b: i32 = 12
    a += 0 or b #  a = 11
    b *= a and 0 #  b = 0

    c: i32 = 14
    c -= a or b #  c = 13

    d: i32 = 16
    d /= c or d #  d = 16
    return (a == 11 and b == 0 and c
         == 13 and d == 16) }
