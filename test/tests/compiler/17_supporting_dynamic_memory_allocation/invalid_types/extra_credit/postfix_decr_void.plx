#  Can't apply postfix ++/-- to void lvalue
extrn x: *any;

pub fn main(none) i32 {
    ++(x[])--
    return false
}
