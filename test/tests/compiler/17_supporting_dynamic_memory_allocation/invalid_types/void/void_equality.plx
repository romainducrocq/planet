pub fn x(none) none;
pub fn main(none) i32 {
    #  you can't compare void expressions
    return x() == cast<none>(10)
}
