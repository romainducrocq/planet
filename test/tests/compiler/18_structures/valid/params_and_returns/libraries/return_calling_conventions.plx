#  Test that we return a wide range of struct types according to the ABI 
import `return_calling_conventions`

pub fn return_int_struct(none) struc one_int {
    retval: struc one_int = $(1, 2)
    return retval
}

pub fn return_two_int_struct(none) struc twelve_bytes {
    retval: struc twelve_bytes = $(10, "12345678")
    return retval
}

pub fn return_double_struct(none) struc one_xmm {
    retval: struc one_xmm = $(100.625)
    return retval
}
pub fn return_two_double_struct(none) struc two_xmm {
    retval: struc two_xmm = $($(8.8, 7.8))
    return retval
}
pub fn return_mixed(none) struc xmm_and_int {
    retval: struc xmm_and_int = $($(10.0), "ab")
    return retval
}
pub fn return_mixed2(none) struc int_and_xmm {
    retval: struc int_and_xmm = $(127, 34e43)
    return retval
}
pub fn return_on_stack(none) struc memory {
    retval: struc memory = $(1.25, "xy", 100l, 44)
    return retval
}

pub fn leaf_call(t_i: struc two_ints, c: i32, d: f64) i32 {
    #  validate t_i
    if t_i.c ~= '_' or t_i.arr[0] ~= 5 or t_i.arr[1] ~= 6 or t_i.arr[2] ~= 7 {
        return 0
    }

    #  validate c1 and d1 (originally passed in a struct int_and_xmm)
    if c ~= 'p' or d ~= 4.56 {
        return 0
    }
    return 1 #  success
}

pub fn pass_and_return_regs(i: i32, d: f64, strct: struc int_and_xmm, c: i32, t_i: struc two_ints,
    l: i64, o_i_e: struc one_int_exactly, c2: i32) struc memory {
    #  include a stack variable to make sure it doen't overwrite return value
    #  pointer or vice versa
    stackbytes: [8]char = "zyxwvut"
    retval: struc memory = $(false, $(0, 0, 0), nil, 0)

    #  make another function call to ensure that passing parameters
    #  doesn't overwrite return address in RDI or other struct eightybtes
    #  passed in registers; validate t_i and strct while we're at it
    if not leaf_call(t_i, strct.c, strct.d) {
        retval.i = 1
        return retval
    }
    #  validate scalar params
    if i ~= 6 or d ~= 4.0 or c ~= 5 or l ~= 77 or c2 ~= 99 {
        retval.i = 2
        return retval
    }
    #  validate remainign struct
    if o_i_e.l ~= 567890 {
        retval.i = 3
        return retval
    }

    #  validate stackbytes
    if strcmp(stackbytes, "zyxwvut") {
        retval.i = 4
        return retval
    }
    retval.l = 100
    return retval #  success
}
