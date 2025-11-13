#  Test that we can use character constant in switch statement
pub fn main(none) i32 {
    match 'x' {
        -> 1 {
            return 1
        } #  fail
        -> 2 {
            return 2
        } #  fail
        -> 120 {
            return 0
        } #  success
        otherwise {
            return -1
        } #  fail
    }
}
