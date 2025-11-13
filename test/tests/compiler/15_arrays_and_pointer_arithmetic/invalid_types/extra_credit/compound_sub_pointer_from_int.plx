#  += and -= operators: RHS must not be a pointer regardless of LHS type
pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    elem: *i32 = arr + 1
    i: i32 = 0
    i -= elem
    return 0
}
