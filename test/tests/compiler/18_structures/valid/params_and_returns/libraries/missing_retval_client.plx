#  Test case where the return type would be passed on the stack, but the callee
#  * is missing a return statement. This is well-defined as long as the caller
#  * doesn't try to use the return value
#  * 
import "missing_retval"

pub fn main(none) i32 {
    array: [4]i32 = $(1, 2, 3, 4)
    missing_return_value(array + 2)
    #  make sure the function returns normally and it updated array[2]
    #  as expected
    return array[2] == 10
}
