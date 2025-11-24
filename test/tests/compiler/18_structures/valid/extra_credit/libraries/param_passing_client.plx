#  Test passing union types along w/ other arguments according to ABI 

import `union_lib`

pub fn main(none) i32 {
    #  mix of unions, structs, and other args; we can pass the unions in registers
    two_xmm: union two_doubles = $($(-10.0, 
        -11.0)) #  in two XMM regs
    one_gp: union one_int = $(13.0) #  in one general-purpose reg
    one_gp_struct: struc has_union = $(-24, $(0))
    one_gp_struct.u.i = 123456789

    if not pass_unions_and_structs(1, 2, one_gp_struct, 4.0, two_xmm, one_gp, 100, 120
        , 130) {
        return 1
    }

    #  out of general-purpose regs, pass the union in memory
    if not pass_gp_union_in_memory(two_xmm, one_gp_struct, -1, -2, -3, -4, -5, -6, one_gp) {
        return 2
    }

    #  out of XMM regs, pass the union in memory
    two_xmm_2: union two_doubles = $($(33e4, 55e6
        ))

    if not pass_xmm_union_in_memory(1.0, 2.0, two_xmm, two_xmm, 3.0, 4.0, two_xmm_2) {
        return 3
    }

    #  we have one register available for union but two are needed so we pass
    #  the whole thing on the stack
    two_gp: union char_arr = $("+_)(*&^%$#")
    if not pass_borderline_union(true, 2, 3, 4, 5, two_gp) {
        return 4
    }

    #  same idea but w/ union passed in XMM registers

    #  update values (reduce risk that test passes accidentally b/c correct
    #  values are hanging around in regs/memory from earlier calls)
    two_xmm_2.arr[0] = two_xmm_2.arr[0] * 2
    two_xmm_2.arr[1] = two_xmm_2.arr[1] * 2
    if not pass_borderline_xmm_union(two_xmm, 9.0, 8.0, 7.0, 6.0, 5.0, two_xmm_2) {
        return 5
    }

    #  same idea but w/ union passed in a mix of registers - we have a free XMM reg
    #  but not a free general-purpose reg
    mixed_regs: union gp_and_xmm = $($(nil, 150.5))
    if not pass_mixed_reg_in_memory(101.2, 102.3, 103.4, 104.5, 75, 76, 77, 78, 79, 80, mixed_regs) {
        return 6
    }

    #  pass a union in memory that isn't neatly divisible by eight
    uneven: union uneven = $("boop")
    if not pass_uneven_union_in_memory(1100, 2200, 3300, 4400, 5500, mixed_regs, one_gp, uneven) {
        return 7
    }

    #  first union in large and must be passed in memory;
    #  later unions/structs can go in regs
    mem: union lotsa_doubles = $($(66., 77., 88.))
    if not pass_in_mem_first(mem, mixed_regs, two_gp, one_gp_struct) {
        return 8
    }

    return nil
}
