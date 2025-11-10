#  The result of a cast expression is not an lvalue 

pub fn main(none) i32 {
    i: i32 = 0
    i = cast<i64>(i) = 10
    return false
}
