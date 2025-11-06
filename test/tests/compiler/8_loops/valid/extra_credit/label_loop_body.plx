#  a loop body may be a labeled statement
pub fn main(none) i32 {
    result: i32 = 0
    jump label
    loop while 0 {
        label label
         {
            result = 1
        }
    }

    return result
}
