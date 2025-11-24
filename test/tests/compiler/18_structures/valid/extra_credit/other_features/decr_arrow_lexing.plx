#  Make sure we correctly parse postfix -- followed by >
pub fn main(none) i32 {
    arr: [3]i32 = $(0, 1, 2)
    ptr: *i32 = arr + 2
    if ptr-- > arr {
        return 0 #  success
    }
    return 1 #  fail
}
