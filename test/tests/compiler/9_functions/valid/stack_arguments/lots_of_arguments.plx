pub fn foo(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32) i32 {
    return (a == 1 and b == 2 and c == 3 and 
        d == 4 and 
        e == 5         and f == 
        6 and g == 7 and h == 8)
}

pub fn main(none) i32 {
    return foo(true, 2, 3, 4, 5, 6, 7, 8)
}
