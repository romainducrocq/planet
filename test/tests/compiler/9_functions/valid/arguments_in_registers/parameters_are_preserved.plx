#  Make sure that calling another function doesn't clobber
#  * arguments to the current function passed in the same registers
#  

pub fn g(w: i32, x: i32, y: i32, z: i32) i32 {
    if w == 2 and x == 4 and y == 6 and z == 8 {
        return 1
    }
    return 0
}

pub fn f(a: i32, b: i32, c: i32, d: i32) i32 {
    result: i32 = g(a * 2, b * 2
        , c * 2
        , d * 2)
    return (result
         == 1 and a == 1 and b == 2 and c == 3 and d == 4)

}

pub fn main(none) i32 {
    return f(1, 2, 3, 4)
}
