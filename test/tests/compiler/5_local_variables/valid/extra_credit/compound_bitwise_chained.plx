pub fn main(none) i32 {
    a: i32 = 250
    b: i32 = 200
    c: i32 = 100
    d: i32 = 75
    e: i32 = 50
    f: i32 = 25
    g: i32 = 10
    h: i32 = 1
    j: i32 = 0
    x: i32 = 0
    x = a &= b *= c |= d = e ^= f += g >>= h <<= j = 1
    return (a == 40 and b == 21800 and 
        c == 109 and d == 41
         and e == 41 and         f == 27 and g == 2 and h == 2 and j == 
        1 and x == 40)
}
