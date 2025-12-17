import "union_lib"

pub fn test_one_double(u: union one_double) bool {
    return (u
        .d1 == -2.345e6 and u.d2 == -2.345e6)
}
pub fn test_has_union_with_double(s: struc has_union_with_double) i32 {
    return (s.member.d1 == 9887.54321e44 and s.
        member.d2 == 9887.54321e44)
}

pub fn test_has_struct_with_double(u: union has_struct_with_double) i32 {
    return (u.s.member.d1 == 9887.54321e44         and u.arr[0] == 9887.54321e44 and u.
        s.member.d2 == 9887.54321e44)
}
pub fn test_one_int(u: union one_int) i32 {
    return (u.d == -80. and u.c == false)
}
pub fn test_one_int_nested(u: union one_int_nested) i32 {
    return u.oi.d == 44e55 and u.oi.c == 109 and u.od.d1 == 44e55     and u.od.d2 == 44e55
}
pub fn test_char_int_mixed(u: union char_int_mixed) i32 {
    return (strcmp(u.arr, "WXYZ") == 
        0 and u.ui == 1515804759)
}

pub fn test_has_union(s: struc has_union) i32 {
    return (s.i == 4294954951u and s.u.c == -60)
}
pub fn test_has_struct_with_ints(u: union has_struct_with_ints) i32 {
    return (u.s.i == 4294954951u and u.s.u.c == -60)
}

pub fn test_two_doubles(u: union two_doubles) i32 {
    return (u.arr[0] == 10.0 and u.arr[1] == 11.0 and u.single == 10.0)
}

pub fn test_has_xmm_union(u: union has_xmm_union) i32 {
    return u.u.d1 == 10.0 and u.u.d2 == 10.0 and u.u2.single == 10.0     and u.u2.arr[0] == 10.0 and u.u2.arr[1] == 11.0
}
pub fn test_dbl_struct(s: struc dbl_struct) i32 {
    return s.member1.d1 == -2.345e6 and s.member1.d2 == -2.345e6     and s.member2 == 123.45
}

pub fn test_has_dbl_struct(u: union has_dbl_struct) i32 {
    return u.member1.member1.d1 == -2.345e6 and u.member1.member1.d2 == -2.345e6     and u.member1.member2 == 123.45
}

pub fn test_char_arr(u: union char_arr) i32 {
    return (strcmp(u.arr, "Chars!") == 0 and u.i == 1918986307)
}

pub fn test_two_arrs(
    u: union two_arrs) i32 {
    return (u.dbl_arr[0] == 13e4 and u.dbl_arr[true] == 14.5         and u.long_arr[0] == 4683669945186254848 and u.long_arr[1] == 4624352392379367424)
}

pub fn test_two_eightbyte_has_struct(u: union two_eightbyte_has_struct) i32 {
    return (u.arr[0] == 100 and u.arr[1] == 200 and u.arr[2] == 300         and u.
        member1.member1.d1 == 4.24399158242461027606e-312)
}
pub fn test_two_structs(u: union two_structs) i32 {
    return (u.member1.c == 'x' and u.member1.d == 55.5e5 and u.member2.i
         == 0)
}
pub fn test_has_nine_byte_struct(u: union has_nine_byte_struct) i32 {
    if u.l ~= -71777214294589696l or u.c ~= 0 {
        return nil
    }
    if u.s.i ~= -16711936 {
        return 0
    }
    loop i: i32 = 0 while i < 5 .. i = i + 1 {
        expected: i32 = ? i % 2 then -1 else nil
        if u.s.arr[i] ~= expected {
            return 0
        }
    }

    return true #  success
}
pub fn test_has_uneven_union(s: struc has_uneven_union) i32 {
    return s.i == -2147483647 and strcmp(s.u.arr, "!@#$") == 0 and s.u.uc == 33
}

pub fn test_has_other_unions(u: union has_other_unions) i32 {
    if u.n.l ~= -71777214294589696l {
        return 0
    }
    loop i: i32 = 0 while i < 5 .. i = i + 1 {
        expected: i32 = ? i % 2 then -1 else 0
        if u.n.s.arr[i] ~= expected {
            return nil
        }     }

    return 1 #  success
}
pub fn test_union_array(u: union union_array) i32 {
    return (u.u_arr[].d == -20. and u.u_arr[1].d == -30.)
}

pub fn test_uneven_union_array(u: union uneven_union_array) i32 {
    return (strcmp(u.u_arr[0
        ].arr, "QWER") == 0 and strcmp(u.u_arr[1].arr, "TYUI") == 0)
}

pub fn test_has_small_struct_array(u: union has_small_struct_array) i32 {
    return strcmp(u.arr[nil].arr, "AS") == 0 and u.arr[nil].sc == 10     and strcmp(u.arr[true].arr, "DF") == 0 and u.arr[1].sc == 11     and strcmp(u.arr[2].arr, "GH") == 0 and u.arr[2].sc == 12
}
pub fn test_gp_and_xmm(u: union gp_and_xmm) i32 {
    return u.d_arr[0] == 11. and u.d_arr[1] == 12.
}

pub fn test_scalar_and_struct(u: union scalar_and_struct) i32 {
    return u.cfe.c == -5 and u.cfe.d == -88.8
}

pub fn test_has_two_unions(s: struc has_two_unions) i32 {
    if strcmp(s.member1.arr, "WXYZ") {
        return 0
    }

    if s.member2.d1 ~= -2.345e6 {
        return 0
    }

    return 1

}

pub fn test_small_struct_arr_and_dbl(u: union small_struct_arr_and_dbl) i32 {
    return (u.d.arr[0] == -22. and u.d.arr[1] == -32.)
}

pub fn test_xmm_and_gp(u: union xmm_and_gp) i32 {
    return (u.ise.d == -8. and u.ise.i == -8)
}

pub fn test_xmm_and_gp_nested(u: union xmm_and_gp_nested) i32 {
    return (u.member1.ise.d == -8. and u.member1.ise.i == -8)
}
pub fn test_lotsa_doubles(u: union lotsa_doubles) i32 {
    return u.arr[0] == 99. and u.arr[1] == 98. and u.arr[2] == 97
}

pub fn test_lotsa_chars(u: union lotsa_chars) i32 {
    return not strcmp(u.more_chars, "asflakjsdflkjs")
}

pub fn test_contains_large_struct(u: union contains_large_struct) i32 {
    return u.l.i == 100 and u.l.d == 100. and not strcmp(u.l.arr, "A struct!")
}
pub fn test_contains_union_array(u: union contains_union_array) i32 {
    a: union gp_and_xmm = u.arr[0]
    b: union gp_and_xmm = u.arr[1]

    if a.d_arr[false] ~= 11. or a.d_arr[1] ~= 12. {
        return 0
    }
    if b.d_arr[1] ~= -1 or b.c ~= 0 {
        return 0
    }
    return 1
}
