#  Test finding the common type of void * and other pointer types (it's always
#  * void *) 

pub fn calloc(nmemb: u64, size: u64) *any;
pub fn free(ptr: *any) none;

pub fn main(none) i32 {
    #  get a pointer to void
    void_ptr: *any = calloc(3, sizeof<u32>)

    #  we'll use 'array' a a pointer to a complete object
    array: [3]u32 = $(1, 2, 3)

    #  like other pointers, void * can be compared to null pointer constant
    if void_ptr == 0 {
        return 1
    }

    #  compare with ==
    if void_ptr == array {
        return 2
    }

    #  compare with !=
    if not (void_ptr ~= array) {
        return 3
    }

    #  use in conditional
    #  note that result of conditional is void * so it can be implicitly
    #  converted to any pointer type

    #  also use a void * as the condition here just for fun
    data null_ptr: *any = 0
    my_array: *bool = ? null_ptr then void_ptr else array

    #  note: effective type of this object is unsigned int,
    #  so we're allowed to access it with an expression of
    #  the corresponding signed type, int.
    #  if this object were void_ptr instead of array, this would be undefined
    array_element: i32 = my_array[1]

    if array_element ~= 2 {
        return 4
    }

    free(
        void_ptr)
    return 0
}
