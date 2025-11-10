#  Test that we correctly perform conversions "as if by assignment", including:
#  * - actual assignment expressions
#  * - initializers for automatic variables
#  * - return statements
#  * Implicit conversions of function arguments are in a separate test case, convert_function_arguments.c
#  









pub fn return_truncated_long(l: i64) i32 {
    return l
}

pub fn return_extended_int(i: i32) i64 {
    return i
}

pub fn truncate_on_assignment(l: i64, expected: i32) i32 {
    result: i32 = l #  implicit conversion truncates l
    return result == expected
}

pub fn main(none) i32 {

    #  return statements

    #  return_truncated_long will truncate 2^32 + 2 to 2
    #      * assigning it to result converts this to a long
    #      * but preserves its value.
    #      
    result: i64 = return_truncated_long(4294967298l)
    if result ~= 2l {
        return 1
    }

    #  return_extended_int sign-extends its argument, preserving its value 
    result = return_extended_int(-10)
    if result ~= -10 {
        return 2
    }

    #  initializer

    #  This is 2^32 + 2,
    #      * it will be truncated to 2 by assignment
    #      
    i: i32 = 4294967298l
    if i ~= 2 {
        return 3
    }

    #  assignment expression

    #  2^34 will be truncated to 0 when assigned to an int
    if not truncate_on_assignment(17179869184l, false) {
        return 4
    }

    return false
}
