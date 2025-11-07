#  Make sure we don't clobber argument passed in ECX register by
#  * performing a bitwise shift operation that uses that register 

pub fn x(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32) i32 {
    return a == 1 and b == 2 and c == 3 and d == 4 and e == 5 and f == 6
}

pub fn main(none) i32 {
    a: i32 = 4
    return x(1, 2, 3, 4, 5, 24 >> (a / 
        2))
}
