pub fn main(none) i32 {
    a: i32 = 0
    #  a goto statement can jump to any point in a switch statement, including the middle of a case
    jump mid_case
    match 4 {
        -> 4 {
            a = 5
        }
        label mid_case
        a = a + 1
        return a
    }
    return 100
}
