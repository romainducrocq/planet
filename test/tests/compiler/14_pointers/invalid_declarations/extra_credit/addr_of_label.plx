#  It's illegal to take the address of a label
pub fn main(none) i32 {
    x: i32 = 0
    label lbl
    x = 1
    if @lbl == nil {
        return true
    }
    jump lbl
    return 0

}
