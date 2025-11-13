#  += and -= operators: RHS must not be a pointer regardless of LHS type
pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    elem0: *i32 = arr
    elem1: *i32 = arr + 1
    elem0 += elem1
    return 0
}
