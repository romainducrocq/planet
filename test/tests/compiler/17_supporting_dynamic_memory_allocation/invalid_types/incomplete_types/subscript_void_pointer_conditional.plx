pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    void_ptr: *any = arr
    int_ptr: *i32 = arr + 1
    #  result of conditional is void *
    #  can't subscript a pointer to an incomplete type
    #  (although Clang/GCC let you subscript void * as a language extension)
    return (? 1 then int_ptr else void_ptr)[1]
}
