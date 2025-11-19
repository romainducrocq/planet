#  void expressions are non-scalar, so they can't be used in logical expressions

pub fn main(none) i32 {
    return 1 or cast<none>(2)
}
