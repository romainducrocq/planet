pub fn main(none) i32 {
    # Function declarations aren't permitted in for loop headers.
    x: i32 = 0
    loop fn f(none) i32 while x < 10 .. x = x + 1 {
        return 0
    }
}
