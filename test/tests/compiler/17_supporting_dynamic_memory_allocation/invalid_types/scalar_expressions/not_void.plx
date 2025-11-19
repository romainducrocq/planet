#  void expressions are non-scalar, so they can't be used in logical expressions

pub fn f(none) none;
pub fn g(none) none;
pub fn main(none) i32 {
    return not (? true then f() else g())
}
