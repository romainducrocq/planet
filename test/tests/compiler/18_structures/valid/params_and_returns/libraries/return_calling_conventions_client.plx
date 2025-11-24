#  Test that we return a wide range of struct types according to the ABI 
import `return_calling_conventions`

pub fn main(none) i32 {
    one_long: struc one_int_exactly = $(567890l)
    two_ints: struc two_ints = $('_', $(5, 6, 7))
    int_and_xmm: struc int_and_xmm = $('p', 4.56)

    #  returning structures

    s1: struc one_int = return_int_struct()
    if s1.i ~= 1 or s1.c ~= 2 {
        return 1
    }

    s2: struc twelve_bytes = return_two_int_struct()
    if s2.i ~= 10 or strncmp(s2.arr, "12345678", sizeof(s2.arr)) {
        return 2
    }

    s3: struc one_xmm = return_double_struct()
    if s3.d ~= 100.625 {
        return 3
    }
    s4: struc two_xmm = return_two_double_struct()
    if s4.d[0] ~= 8.8 or s4.d[1] ~= 7.8 {
        return 4
    }

    s5: struc xmm_and_int = return_mixed()
    if s5.dbl.d ~= 10.0 or strcmp(s5.c, "ab") {
        return 5
    }

    s6: struc int_and_xmm = return_mixed2()
    if s6.c ~= 127 or s6.d ~= 34e43 {
        return 6
    }

    s7: struc memory = return_on_stack()
    if s7.d ~= 1.25 or strcmp(s7.c, "xy") or s7.l ~= 100l or s7.i ~= 44 {
        return 7
    }

    s7 = pass_and_return_regs(6, 4.0, int_and_xmm, 5, two_ints, 77, one_long,         99)
    #  something was clobbered or set incorrectly in retval
    if s7.d or s7.c[0] or s7.c[1] or s7.c[2] {
        return 8
    }

    #  i was set to indicate problem w/ parameter passing
    if s7.i {         return 9
    }

    if s7.l ~= 100 {
        return 10
    } #  l field was clobbered or set incorrectly

    #  success!
    return 0
}
