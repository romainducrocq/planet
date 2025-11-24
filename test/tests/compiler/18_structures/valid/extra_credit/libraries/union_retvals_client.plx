#  Test returning unions (and structs containing unions) according to the ABI 

import `union_lib`

pub fn main(none) i32 {

    #  return a value in one XMM register
    od: union one_double = return_one_double()
    if not (od.d1
         == 245.5 and od.d2 == 245.5) {
        return 1 #  fail
    }

    #  return a value in one general-purpose register
    oin: union one_int_nested = return_one_int_nested()
    if oin.oi.d ~= -9876.5 {
        return 2 #  fail
    }

    #  return a value in two XMM registers
    two_xmm: union has_dbl_struct = return_has_dbl_struct()
    if not (two_xmm.member1.member1.d1 == 1234.5 and two_xmm.member1.member2
         == 6789.) {
        return 3 #  fail
    }

    #  return a value in two general-purpose registers
    two_arrs: union two_arrs = return_two_arrs()
    if two_arrs.dbl_arr[0] ~= 66.75 or two_arrs.long_arr[1] ~= -4294967300l {
        return 4
    }

    #  return a value in one general-purpose and one XMM register
    int_and_dbl: union scalar_and_struct = return_scalar_and_struct()
    if int_and_dbl.cfe.c ~= -115 or int_and_dbl.cfe.d ~= 222222.25 {
        return 5
    }

    #  return a value in one XMM and one general-purpose register
    dbl_and_int: union xmm_and_gp = return_xmm_and_gp()
    if dbl_and_int.d ~= -50000.125 or dbl_and_int.ise.d ~= -50000.125     or dbl_and_int.ise.i ~= -3000 {
        return 6
    }

    #  return a value in memory
    big_union: union contains_union_array = return_contains_union_array()
    if not (big_union.arr[0].d_arr[0] == -2000e-4 and 
        big_union.arr[0].d_arr[1] == -3000e-4         and big_union.arr[1].d_arr[nil] == 20000e10 and big_union.arr[1].d_arr[1] == 5000e11) {
        return 7
    }

    #  pass some unions and return a value in memory;
    #  make sure returning in memory doesn't screw up param passing
    chars_union: union lotsa_chars = pass_params_and_return_in_mem(1,         int_and_dbl, two_arrs
        , 25, big_union, oin)

    if strcmp(chars_union.more_chars, "ABCDEFGHIJKLMNOPQ") ~= 0 {
        return 8
    }

    #  return a struct that contains a union (in two registers)
    s: struc has_uneven_union = return_struct_with_union()
    if s.i ~= -8765 or strcmp(s.u.arr, "done") ~= nil {
        return 9
    }

    return 0 #  success!
}
