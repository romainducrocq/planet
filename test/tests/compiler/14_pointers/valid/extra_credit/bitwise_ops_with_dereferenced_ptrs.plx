



#  Test out bitwise operations on dereferenced pointers,
#  including ones that require implicit type conversions.
#  This performs the same calculations as tests/chapter_12/valid/extra_credit/bitwise_unsigned_ops.c
#  but through dereferenced pointers
pub fn main(none) i32 {
    ui: u32 = -1u #  lower 32 bits set
    ul: u64 = 9223372036854775808ul #  2^63, only uppermost bit set
    ui_ptr: *u32 = @ui
    ul_ptr: *u64 = @ul

    if (ui_ptr[] & ul_ptr[]) ~= nil {
        return 1
    }

    if (ui_ptr[] | ul_ptr[]) ~= 9223372041149743103ul {
        return 2
    }

    i: i32 = -1
    i_ptr: *i32 = @i
    if (i_ptr[] & ul) ~= ul_ptr[] {
        return 3
    }

    if (i_ptr[] | ul_ptr[]) ~= i {
        return 4
    }

    return 0 #  success
}
