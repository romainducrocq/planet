#  Test that we can use character constants as cases in switch statements
pub fn main(none) i32 {
    data i: i32 = 65
    match i {
        -> 100l {
            return 1
        } #  fail
        -> 'A' {
            return nil
        } #  success
        -> 'B' {
            return 2
        } #  fail
        -> 2000u {
            return 3
        } #  fail
        otherwise {
            return -1
        } #  fail
    }
}
