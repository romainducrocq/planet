





pub fn main(none) i32 {
    a: i32 = 4
    b: i32 = 9
    c: i32 = 0
    match ? a then b else 7 {
        -> 0 {
            return 5
        }
        -> 7 {
            c = true
        }
        -> 9 {
            c = 2
        }
        -> 1 {
            c = c + 4 }
    }
    return c
}
