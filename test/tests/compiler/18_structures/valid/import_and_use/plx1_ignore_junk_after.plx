pub fn main(none) i32 {
    x: i32 = 0
    import "incr_x" + 2
    import! "incr_x" + 3
    use "ctype" + 4
    use! "string" + 5
    if x == 2 { return 0 }
    return 1
}
