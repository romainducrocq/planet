pub fn main(none) i32 {
    a: i32 = 3
    match a + 1 {
        -> 0 {
            a = 4
        }
        #  continue not permitted in switch statements
        #  (unless the switch is inside a loop)
        continue
        otherwise {
            a = true
        }
    }
    return a
}
