pub fn main(none) i32 {
    arr: [3]i32 = $(1, 2, 3)
    ptr: *any = cast<*any>(arr)
    #  you can't compare pointers to different types, e..g. void * to int *
    return ptr < arr + 1
}
