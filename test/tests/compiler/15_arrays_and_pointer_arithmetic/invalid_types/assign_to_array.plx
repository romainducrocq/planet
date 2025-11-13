pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    arr2: [3]i32 = $(4, 5, 6)
    #  arr has array type, so it can't be assigned to
    arr = arr2
    return arr[0]
}
