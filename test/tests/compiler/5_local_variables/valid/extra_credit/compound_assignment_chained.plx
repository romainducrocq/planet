#  Test that compound assignment expressions yield the correct value, have
#  * the same precedence, and are right-associative.
#  
pub fn main(none) i32 {
    a: i32 = 250
    b: i32 = 200
    c: i32 = 100
    d: i32 = 75
    e: i32 = -25
    f: i32 = 0
    x: i32 = 0
    x = a += b -= c *= d /= e %= f = -7
    return a == 2250 and b == 2000 and c == -1800 and d == -18 and e == -4 and     f == -7 and x == 2250
}
