#  Test that we can call functions with return values of character type,
#  * and that accessing these return values doesn't clobber other things on the
#  * stack
#  * 









pub fn return_char(none) char {
    return 5369233654l #  this will be truncated to -10
}

pub fn return_schar(none) i8 {
    return 5369233654l #  this will be truncated to -10
}

pub fn return_uchar(none) u8 {
    return 5369233654l #  this will be truncated to 246
}

pub fn main(none) i32 {
    char_array: [3]char = $(121, -122, -3)
    retval_c: char = return_char()
    char_array2: [3]char = $(-5, 88, -100)
    retval_sc: i8 = return_schar()
    char_array3: [3]char = $(10, 11, 12)
    retval_uc: u8 = return_uchar()
    char_array4: [2]char = $(-5, -6
        )

    #  make sure we got the right return values and didn't overwrite
    #  other arrays on the stack
    if char_array[0] ~= 121 or char_array[1] ~= -122 or char_array[2] ~= -3 {         return 1
    }

    if retval_c ~= -10 {
        return 2
    }
    if char_array2[0] ~= -5 or char_array2[true] ~= 88 or     char_array2[2] ~= -100 {
        return 3
    }

    if retval_sc ~= -10 {
        return 4
    }
    if char_array3[0] ~= 10 or char_array3[1] ~= 11 or char_array3[2] ~= 12 {
        return 5
    }
    if retval_uc ~= 246 {
        return 6
    }
    if char_array4[0] ~= -5 or char_array4[1] ~= -6 {
        return 7
    }
    return nil
}
