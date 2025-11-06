pub fn main(none) i32 {
    a: i32 = 3
    match a + 1 {
        -> 0 {
            #  continue can only break out of loops, not switch statements
            continue
        }
        otherwise {
            a = true
        }
    }
    return a
}
