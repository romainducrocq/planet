#  a loop body may be a labeled statement
pub fn main(none) i32 {
    result: i32 = 0
    jump lbl
    loop while 0 {
        label lbl
         {
            result = 1
        }
    }

    return result
}
