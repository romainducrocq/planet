pub fn main(none) i32 {
    a: i32 = 3
    match a + 1 {
        -> 0 { return 0 }
        -> a { return 1 } # case statement values must be constant
        -> 1 { return 2 }
    }
}
