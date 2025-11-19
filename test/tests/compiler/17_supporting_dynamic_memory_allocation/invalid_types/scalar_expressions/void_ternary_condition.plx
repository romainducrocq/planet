pub fn f(none) none;

pub fn main(none) i32 {
    #  the condition in a ternary expression must have scalar type
    return ? f() then 1 else 2
}
