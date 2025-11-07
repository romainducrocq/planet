# Trailing commas aren't permitted in parameter lists
pub fn foo(a: i32, ) i32 {
    return a + 1
}

pub fn main(none) i32 {
    return foo(4)
}
