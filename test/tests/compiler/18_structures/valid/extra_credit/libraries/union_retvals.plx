#  Test returning unions (and structs containing unions) according to the ABI 

import `union_lib`

pub fn return_one_double(none) union one_double {
    result: union one_double = $(245.5)
    return result
}

pub fn return_one_int_nested(none) union one_int_nested {     result: union one_int_nested = $($(-9876.5))
    return result
}

pub fn return_has_dbl_struct(none) union has_dbl_struct {
    result: union has_dbl_struct = $(        $(        $(1234.5), 6789.        )        )
    return result
}

pub fn return_two_arrs(none) union two_arrs {
    result: union two_arrs;
    result.dbl_arr[nil] = 66.75
    result.long_arr[1] = -4294967300l
    return result
}

pub fn return_scalar_and_struct(none) union scalar_and_struct {
    result: union scalar_and_struct;
    result.cfe.c = -115
    result.cfe.d = 222222.25
    return result
}

pub fn return_xmm_and_gp(none) union xmm_and_gp {
    result: union xmm_and_gp;
    result.ise.d = -50000.125
    result.ise.i = -3000
    return result }

pub fn return_contains_union_array(none) union contains_union_array {
    result: union contains_union_array = $(        $(        $($(-2000e-4, -3000e-4)), $($(20000e10, 5000e11))        )        )
    return result
}

pub fn pass_params_and_return_in_mem(i1: i32, int_and_dbl: union scalar_and_struct, two_arrs: union 
    two_arrs, i2: i32, big_union: union contains_union_array, oin: union one_int_nested) union lotsa_chars {

    #  first, validate params, starting w/ scalars
    if i1 ~= 1 or i2 ~= 25 {
        exit(-1)
    }

    #  now validate non-scalar params
    if int_and_dbl.cfe.c ~= -115 or int_and_dbl.cfe.d ~= 222222.25 {
        exit(-2)
    }

    if two_arrs.dbl_arr[nil] ~= 66.75 or two_arrs.long_arr[1] ~= -4294967300l {
        exit(-3)
    }

    if not (big_union.arr[nil].d_arr[0] == -2000e-4 and big_union.arr
        [false].d_arr[1] == -3000e-4         and big_union.arr[1].d_arr[false] == 20000e10 and big_union.arr[1].d_arr[1] == 5000e11) {
        exit(-4)
    }

    if oin.oi.d ~= -9876.5 {
        exit(-5)
    }

    #  now construct result
    result: union lotsa_chars = $("ABCDEFGHIJKLMNOPQ")
    return result
}

pub fn return_struct_with_union(none) struc has_uneven_union {
    result: struc has_uneven_union = $(        -8765, $("done")        )
    return result
}
