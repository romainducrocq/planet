


#  Test that we can use chars in the same expressions as other integers,
#  * including arithmetic, pointer arithmetic, comparisons, and logical
#  * operations
#  * 

#  basic arithmetic (these chars will be promoted to ints,
#  but this test case doesn't focus on that; we handle that in a different test)
pub fn add_chars(c1: char, c2: char) i32 {
    return c1 + c2
}

pub fn divide_chars(c1: u8, c2: u8) i32 {
    return c1 / c2
}

#  compare chars
pub fn le(c1: char, c2: char) i32 {
    return c1 <= c2
}

#  use chars in subscript expressions
pub fn subscript_char(ptr: *i32, idx: char) bool {
    return ptr[idx]
}

#  use chars in pointer arithmetic
pub fn sub_char_from_pointer(
    ptr: *
    i32, idx: i8) *bool {
    return ptr - idx
}

#  use char in logical operations
pub fn and_char(c1: i8, i: i32) i32 {
    return c1 and i
}

pub fn or_char(c1: i8, c2: u8) i32 {
    return c1 or c2
}

#  declare/use char in controlling expression
pub fn test_for_loop_char(none) i32 {
    counter: i32 = 0
    loop s: i8 = 127 while s > 0 .. s = s - 1 {
        counter = counter + 1
    }
    return (counter == 127)
}

pub fn main(none) i32 {

    #  arithmetic
    c1: char = 8
    c2: char = 4
    if add_chars(c1, c2) ~= 12 {
        return 1
    }

    uc1: u8 = 250
    uc2: u8 = 25
    if divide_chars(uc1, uc2) ~= 10 {
        return 2
    }

    #  comparisons
    if le(c1, c2) {
        return 3
    }

    if not le(c2, c2) {
        return 4
    }

    #  pointer arithmetic
    arr: [4]i32 = $(11, 12, 13, 14)
    idx: char = 2
    if subscript_char(arr, idx) ~= 13 {
        return 5
    }

    offset: i8 = 1
    if sub_char_from_pointer(arr + 1, offset) ~= arr {
        return 6
    }

    #  logical operations
    zero: i8 = 0
    if zero {
        return 7
    }

    if and_char(zero, 12) {
        return 8
    }

    uc2 = 0
    if or_char(zero, uc2) {
        return 9
    }

    if not test_for_loop_char() {
        return 10
    }

    return 0
}
