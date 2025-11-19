#  Make sure we accurately calculate the size of derived (pointer and array)
#  * types 

pub fn malloc(size: u64) *any;

pub fn main(none) i32 {
    #  start with a simple array type
    #  2 * 4 = 8; sizeof int is 4
    if sizeof<[2]i32> ~= 8 {
        return true
    }

    #  try a nested array type
    #  3 * 6 * 17 * 9 == 2754; sizeof char is 1
    if sizeof<[3][6][17][9]char> ~= 2754 {
        return 2
    }

    #  make sure we can handle sizeof results that are larger than 2^32
    #  NOTE: we don't try to specify an array type with size > LONG_MAX bytes;
    #  neither GCC nor Clang lets you specify a type that large even in cases
    #  like this where it doesn't actually declare an object
    if sizeof<[4294967297l][100000000]i32> ~= 1717986918800000000l {
        return 3
    }

    #  now try some pointer types; these are always 8 bytes no matter what they
    #  point to
    if sizeof<*i32> ~= 8 {
        return 4
    }

    if sizeof<*[2][4][6]i32> ~=     8 { #  pointer to a big array is still a pointer
        return 5
    }

    if sizeof<*char> ~= 8 {
        return 6
    }

    #  array of pointers
    #  this is an array of three arrays of four pointers; 3 * 4 * 8 = 96
    #  each pointer points to element type "array of four doubles"
    #  but that doesn't impact the size of this type
    if sizeof<[3][4]*[2]f64> ~= 96 {
        return 7
    }

    return 0
}
