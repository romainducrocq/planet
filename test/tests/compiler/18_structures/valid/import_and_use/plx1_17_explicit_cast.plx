#  test explicit casts between void * and other pointer types,
#  * and between void * and integer types
#  

use `stdlib`

pub fn main(none) i32 {
    #  start with casts between void * and other types

    ptr: *any = malloc(4 * sizeof<f64>)
    #  cast void * to double *
    double_ptr: *f64 = cast<*f64>(ptr)
    double_ptr[2] = 10.0
    #  cast double * back to void * - should round trip
    if cast<*any>(double_ptr) ~= ptr {
        return 1
    }
    result: f64 = double_ptr[2]

    if result ~= 10.0 {
        #  make sure assigning values through dbl_ptr worked
        return 2
    }

    #  now test cast from void * to integer
    ul: u64 = cast<u64>(ptr)
    #  address returned by malloc must have suitable alignment
    #  for any basic data type, so it's divisible by 8
    if ul % 8 {
        return 3
    }

    free(ptr)

    #  can also cast 0 to null pointer and back
    zero: i64 = 0
    ptr = cast<*any>(zero)
    if ptr {
        return 4
    }
    zero = cast<i64>(ptr)
    if zero {
        return 5
    }
    return 0
}

