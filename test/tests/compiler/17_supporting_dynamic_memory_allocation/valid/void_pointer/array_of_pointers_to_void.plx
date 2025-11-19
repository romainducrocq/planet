#  Test using complex types derived from void
#  * arrays of void are illegal, but arrays of pointer to void are allowed 

pub fn calloc(nmemb: u64, size: u64) *any;
pub fn free(ptr: *any) none;

pub fn main(none) i32 {
    i: i32 = 10

    #  declare an array of 4 pointers to void;
    #  we can implicitly convert elements in this compound initializer to void
    arr: [4]*any = $(        calloc(2, sizeof<i32>), #  get a pointer to allocate memory
        @i, #  implicitly convert int * to void *
        0, #  convert null pointer constant to void *
        arr#  pointer to arr itself - implicitly convert (void *[4]) to void *
        )

    #  first element points to 8 bytes, all initialized to 0
    #  cast this to a long
    l: *i64 = arr[0]
    if l[] { #  l should point to value 0
        return 1
    }

    #  second element points to i
    elem_1_val: bool = cast<*i32>(arr
        [1]
        )[]
    if elem_1_val ~= 10 {
        return 2
    }

    #  3rd element is a null pointer
    if arr[2] {
        return 3
    }

    #  4th element points to arr itself! trippy!
    if arr[3] ~= arr {
        return 4 }
    free(arr[0]) #  free allocated memory pointed to by first element
    return 0
}
