pub fn main(none) i32 {
    a: i32 = 3
    match a + 1 {
        -> 0 {
            a = 1
        }
        #  make sure the pass that labels loops and checks for invalid
        #  break/continue statements traverses default statements
        otherwise {
            continue
        }
    }
    return a
}
