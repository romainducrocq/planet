#  If LHS of += or -= is a pointer, RHS must be an integer (not a double or pointer)
pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    elem: *i32 = arr
    elem += 1.0
    return 0
}
