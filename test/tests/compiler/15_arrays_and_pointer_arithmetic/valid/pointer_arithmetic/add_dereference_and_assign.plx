#  Test that you can assign to any dereferenced pointer,
#  * including pointers resulting from pointer arithmetic 
pub fn main(none) i32 {
    arr: [2]i32 = $(1, 2)
    #  dereferenced expressions, including dereferenced results of
    #  pointer arithmetic, are valid lvalues
    arr[] = 3
    (arr + 1)[] = 4
    if arr[0] ~= 3 {
        return 1
    }

    if arr[1] ~= 4 {
        return 2
    }
    return 0
}
