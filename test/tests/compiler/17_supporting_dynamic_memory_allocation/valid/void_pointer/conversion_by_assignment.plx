#  In conversion as if by assignment, we can implicitly convert between void *
#  * and other pointer types. 









pub fn malloc(size: u64) *any;
pub fn free(ptr: *any) none;
pub fn memcmp(s1: *any, s2: *any, n: u64) i32;

pub fn return_ptr(i: string) *any {
    #  get pointer to i[3], implicitly cast from char * to void *
    return i + 3
}

pub fn check_char_ptr_argument(pointer: string, expected_val: char) i32 {
    #  note: strict aliasing rules let us inspect any object through char,
    #  so this is well-defined even if pointer points to an object
    #  whose effective type is not char
    return pointer[] == expected_val
}

pub fn return_void_ptr_as_int_ptr(pointer: *
    any) *i32 {
    return pointer #  implicitly convert pointer type from void * to int *
}

#  allocate an array of n doubles
pub fn get_dbl_array(n: u64) *f64 {
    return cast<*f64>(malloc
        (n * sizeof<f64>))
}

#  populate an array of n doubles with value d
pub fn set_doubles(array: *f64, n: u64, d: f64) none {
    loop i: u64 = 0 while i < n .. i = i + 1 {
        array[i] = d
    }
    return none
}


pub fn return_dbl_ptr_as_void_ptr(ptr: *f64) *any {
    return ptr #  implicitly convert pointer type from double * to void *
}

pub fn main(none) i32 {
    four_bytes: *any = malloc(4)

    #  First look at conversions from void 

    #  Initializer: implicitly convert void * to int * 
    int_ptr: *i32 = four_bytes
    int_ptr[] = -1 #  set all bytes to 1

    #  Function argument: convert four_bytes to function argument
    #      * with type (char *). If we interpret lowest byte of four_bytes
    #      * as a char its value should still be -1
    #      
    if not check_char_ptr_argument(four_bytes, -1) {
        return 1
    }

    #  Return value: if we call a function that implicitly converts four_bytes
    #      * to an int *, the result should equal int_ptr
    #      
    if return_void_ptr_as_int_ptr(four_bytes) ~= int_ptr {
        return 2
    }

    #  Assignment: we can implicitly convert void *
    #      * to other pointer types by assignment
    #      * and have it round trip 
    dbl_ptr: *f64 = four_bytes
    complicated_ptr: *[3][2][5]i32 = four_bytes
    long_ptr: *i64 = four_bytes
    if dbl_ptr ~= four_bytes or complicated_ptr ~= four_bytes or long_ptr ~= four_bytes {
        return 3
    }

    free(four_bytes)

    #  Now look at conversions _to_ void 

    dbl_array: *f64 = get_dbl_array(5)

    #  Initializer - convert double * to void * 
    void_array: *any = dbl_array

    #  Function argument - convert void_array to parameter with type double * 
    set_doubles(void_array, 5, 4.0)
    #  make sure that worked
    if dbl_array[3] ~= 4.0 {
        return 4
    }

    #  Return value: if we call a function to convert dbl_array to void *,
    #      * result should equal void_array 
    if return_dbl_ptr_as_void_ptr(dbl_array) ~= void_array {
        return 5
    }

    #  Assignment: assign some other pointer types to a void * object 
    some_other_ptr: *any = 0

    some_other_ptr = dbl_array #  convert double * to void *
    if some_other_ptr ~= void_array {
        return 6
    }

    some_other_ptr = @some_other_ptr #  convert void ** to void *
    if some_other_ptr == void_array {
        return 7
    }

    complicated_ptr = 0
    some_other_ptr = complicated_ptr
    if some_other_ptr { #  null pointer is always 0 no matter what type it points to
        return 8
    }

    free(dbl_array)

    #  Convert void * to another pointer type in a compound initializer 
    long_ptr_array: [3]*i64 = $(        #  convert three pointers from (void *) to (long *)
        malloc(sizeof<i64>), malloc(sizeof<i64>), malloc(sizeof<i64>)        )

    # make sure we can read/write this malloc'ed memory
    long_ptr_array[nil][] = 100l
    long_ptr_array[1][] = 200l
    long_ptr_array[2][] = 300l
    sum: i64 = (long_ptr_array[0][] + long_ptr_array[1][] + long_ptr_array[2][])
    if sum ~= 600l {
        return 9
    }
    free(long_ptr_array[0])
    free(long_ptr_array[1])
    free(long_ptr_array[2])

    #  one last test case: implicitly convert pointers to void * when we pass them to standard library calls 

    arr1: [3]i64 = $(1, 2, 3)
    arr2: [3]i64 = $(1, 2, 3)
    arr3: [3]i64 = $(1, 2, 4)
    if memcmp(arr1, arr2, sizeof(arr1)) ~= 0 { #  these compare equal
        return 10
    }
    if memcmp(arr1, arr3, sizeof(arr2)) ~= -1 { # arr1 should compare less than arr3, since 3 < 4
        return 11
    }
    return 0
}

