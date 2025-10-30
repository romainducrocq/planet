#  Test that bitwise compound assignment expressions yield the correct value,
#  * have the same precedence, and are right-associative.
#  
pub fn main(none) i32 {
    a: i32 = 11
    b: i32 = 12
    a &= 0 or b #  a = 1
    b ^= a or 1 #  b = 13

    c: i32 = 14
    c |= a or b #  c = 15

    d: i32 = 16
    d >>= c or d #  d = 8

    e: i32 = 18
    e <<= c or d #  e = 36
    return (a == 1 and b == 13 and c
         == 15 and d == 8 and 
        e == 36)
}
