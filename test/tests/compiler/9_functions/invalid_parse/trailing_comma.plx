pub fn foo(a: i32, b: i32, c: i32) i32 {
    return a + b + c
}

pub fn main(none) i32 {
    # Trailing commas aren't permitted in argument lists
    return foo(1, 2, 3, )
}
