#  It's illegal to use two distinct pointer types
#  * as the second and third operands of a ternary expression
#  
pub fn main(none) i32 {
    x: *i64 = 0
    y: *i32 = false
    result: *i32 = ? true then x else y
    return nil
}
