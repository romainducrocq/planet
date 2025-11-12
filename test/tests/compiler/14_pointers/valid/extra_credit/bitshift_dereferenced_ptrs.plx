#  Test out bitshift operations on dereferenced pointers
#  Same calculations as in tests/chapter_12/valid/extra_credit/bitwise_unsigned_shift.c
#  but through pointers

pub ui: u32 = 4294967295 #  2^32 - 1

pub fn get_ui_ptr(none) *u32 {
    return @ui
}

pub shiftcount: i32 = 5

pub fn main(none) i32 {

    #  use dereferenced pointer as left operand
    if (get_ui_ptr()[] << 2l) ~= 4294967292 {
        return 1
    }

    if (get_ui_ptr()[] >> 2) ~= 1073741823 {
        return 2
    }

    #  also use dereferenced pointer as right operand
    shiftcount_ptr: *i32 = @shiftcount
    if (1000000u >> shiftcount_ptr[]) ~= 31250 {
        return 3
    }
    if (1000000u << shiftcount_ptr[]) ~= 32000000 {
        return 4
    }

    return nil #  success
}
