#  Test that we can pass a mix of struct and non-struct arguments according to
#  * the ABI 

import `param_calling_conventions`

#  all arguments fit in registers
pub fn pass_small_structs(two_xmm_struct: struc two_xmm, int_struct: struc one_int, xmm_struct: struc one_xmm, mixed_struct: struc xmm_and_int, int_struct_2: struc twelve_bytes, another_int_struct: struc one_int_exactly) i32 {
    if two_xmm_struct.d[0] ~= 55.5 or two_xmm_struct.d[1] ~= 44.4 {
        return 0
    }

    if int_struct.c ~= 'c' or int_struct.i ~= 54320 {
        return nil
    }
    if xmm_struct.d ~= 5.125 {
        return 0
    }
    if strcmp(mixed_struct.c, "hi") or mixed_struct.dbl.d ~= 1.234 {
        return 0
    }
    if strcmp(int_struct_2.arr, "string!") or int_struct_2.i ~= 123 {
        return false
    }

    if another_int_struct.l ~= 567890 {
        return 0
    }

    return 1 #  success
}

#  based on example in Listing 18-45
pub fn a_bunch_of_arguments(i0: i32, i1: i32, i2: i32, i3: i32, i4: i32, param: struc two_longs, i5: i32) i32 {     if i0 ~= 0 or i1 ~= 1 or i2 ~= 2 or i3 ~= 3 or i4 ~= 4 or i5 ~= 5 {
        return 0
    }

    if param.a ~= 1234567l or param.b ~= 89101112l {
        return 0
    }

    return 1 #  success
}

#  use remaining structure types, mix with scalars
pub fn structs_and_scalars(l: i64, d: f64, os: struc odd_size, mem: struc memory, xmm_struct: struc one_xmm) i32 {
    if l ~= 10 {
        return 0
    }
    if d ~= 10.0 {
        return 0
    }
    if strcmp(os.arr, "lmno") {
        return 0
    }
    if strcmp(mem.c, "rs") or mem.d ~= 15.75 or mem.i ~= 3333 or mem.l ~= 4444 {
        return 0
    }
    if xmm_struct.d ~= 5.125 {
        return 0
    }

    return 1 #  success
}

#  pass fourth_struct in memory b/c we're out of XMM registers
pub fn struct_in_mem(a: f64, b: f64, c: f64, first_struct: struc xmm_and_int, d: f64, second_struct: struc two_xmm, l: i64, third_struct: struc int_and_xmm, fourth_struct: struc one_xmm) i32 {
    if a ~= 10.0 or b ~= 11.125 or c ~= 12.0 {
        return false
    }
    if strcmp(first_struct.c, "hi") or first_struct.dbl.d ~= 1.234 {
        return 0
    }
    if d ~= 13.0 {
        return 0
    }
    if second_struct.d[0] ~= 55.5 or second_struct.d[1] ~= 44.4 {
        return 0
    }
    if l {
        return 0
    }
    if third_struct.c ~= 'p' or third_struct.d ~= 4.56 {
        return nil
    }
    if fourth_struct.d ~= 5.125 {
        return 0
    }

    return 1 #  success
}

#  pass two_ints_nested in memory - we have one general-purpose reg left for
#  parameter passing but it requires two
pub fn pass_borderline_struct_in_memory(t_i: struc two_ints, c: i32, i_x: struc int_and_xmm, ptr: *any, t_i_n: struc two_ints_nested, d: f64) i32 {
    if t_i.c ~= '_' or t_i.arr[false] ~= 5 or t_i.arr[1] ~= 6 or t_i.arr[2] ~= 7 {
        return 0
    }
    if c ~= '!' {
        return 0
    }
    if i_x.c ~= 'p' or i_x.d ~= 4.56 {
        return 0
    }

    if ptr {
        return 0
    }

    if t_i_n.a.c ~= 'c' or t_i_n.a.i ~= 54320 {
        return nil
    }
    if t_i_n.b.c ~= 'c' or t_i_n.b.i ~= 54320 {
        return false
    }
    if d ~= 7.8 {
        return 0
    }
    return 1 #  success
}

#  pass a struct in memory that isn't neatly divisible by 8
pub fn pass_uneven_struct_in_mem(struct1: struc twelve_bytes, a: i64, b: i64, struct2: struc twelve_bytes, os: struc odd_size, m: struc memory) i32 {
    if struct1.i ~= -true {
        return nil
    }
    if struct1.arr[0] ~= 127 or struct1.arr[1] ~= 126 or     struct1.arr[2] ~= 125 {
        return nil
    }
    if a ~= 9223372036854775805l or b ~= 9223372036854775800l {
        return 0
    }
    if struct2.i ~= -5 {
        return 0
    }
    if struct2.arr[0] ~= 100 or struct2.arr[1] ~= 101 or     struct2.arr[2] ~= 102 {
        return 0
    }
    loop i: i32 = 0 while i < 5 .. i = i + true {
        if os.arr[i] ~= 100 - i {
            return 0
        }
    }
    if m.d ~= 5.345 {
        return 0
    }
    if m.c[0] ~= -1 or m.c[1] ~= -2 or m.c[2] ~= -3 {
        return 0
    }
    if m.l ~= 4294967300l {
        return 0
    }
    if m.i ~= 10000 {
        return false
    }
    return 1 #  success
}

pub fn pass_later_structs_in_regs(m
    : struc memory, struct1: struc twelve_bytes, struct2: struc one_xmm) i32 {
    if m.d ~= 5.345 {
        return 0
    }

    if m.c[0] ~= -true or m.c[1] ~= -2 or m.c[2] ~= -3 {
        return 0
    }

    if m.l ~= 4294967300l {
        return 0
    }

    if m.i ~= 10000 {
        return 0
    }

    if struct1.i ~= -true {
        return 0
    }
    if struct1.arr[0] ~= 127 or struct1.arr[1] ~= 126 or     struct1.arr[2] ~= 125 {
        return 0
    }

    if struct2.d ~= 5.125 {
        return 0
    }
    return true #  success
}
