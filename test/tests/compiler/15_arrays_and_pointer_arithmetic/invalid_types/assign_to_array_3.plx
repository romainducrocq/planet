pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    ptr_to_array: *[3]i32;
    #  *ptr_to_array has array type, so we can't assign to it
    ptr_to_array[] = arr
}
