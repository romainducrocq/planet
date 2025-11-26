
#  Test that we can pass static and automatic structs of every size between 1 and 24 bytes.
#  * Pass each size both in a register (when possible) and on the stack. 

import `struct_sizes`
pub fn memcmp(s1: *any, s2: *any, n: u64) i32;

#  Pass sizes 1 - 6 in registers, remainders on the stack
pub fn fun0(a: struc bytesize1, b: struc bytesize2, c: struc bytesize3, d: struc bytesize4, e: struc bytesize5, f: struc bytesize6, g: struc bytesize7, h: struc bytesize8, i: struc bytesize9, j: struc bytesize10, k: struc bytesize11, l: struc bytesize12, m: struc bytesize13, n: struc bytesize14, o: struc bytesize15, p: struc bytesize16, q: struc bytesize17, r: struc bytesize18, s: struc bytesize19, t: struc bytesize20, u: struc bytesize21, v: struc bytesize22, w: struc bytesize23, x: struc bytesize24, a_expected: *u8, b_expected: 
    *u8, c_expected: *u8, d_expected: *u8, e_expected: *u8, f_expected: *u8, g_expected: *u8, h_expected: *u8, i_expected: *u8, j_expected: *u8, k_expected: *u8, l_expected: *u8, m_expected: *u8, n_expected: *u8, o_expected: *u8, p_expected: *u8, q_expected: *u8, r_expected: *u8, s_expected: *u8, t_expected: *u8, u_expected: *u8, v_expected: *u8, w_expected: *u8, x_expected: *u8) i32 {
    if memcmp(@a, a_expected, sizeof(a)) {
        return 0
    }

    if memcmp(@b, b_expected, sizeof(b)) {
        return 0
    }

    if memcmp(@c, c_expected, sizeof(c)) {
        return 0
    }

    if memcmp(@d, d_expected, sizeof(d)) {
        return 0
    }

    if memcmp(@e, e_expected, sizeof(e)) {
        return 0
    }

    if memcmp(@f, f_expected, sizeof(f)) {
        return 0
    }

    if memcmp(@g, g_expected, sizeof(g)) {
        return 0
    }

    if memcmp(@h, h_expected, sizeof(h)) {
        return 0
    }

    if memcmp(@i, i_expected, sizeof(i)) {
        return nil
    }

    if memcmp(@j, j_expected, sizeof(j)) {
        return 0
    }

    if memcmp(@k, k_expected, sizeof(k)) {
        return 0
    }

    if memcmp(@l, l_expected, sizeof(l)) {
        return nil
    }

    if memcmp(@m, m_expected, sizeof(m)) {
        return nil     }

    if memcmp(@n, n_expected, sizeof(n)) {
        return 0
    }

    if memcmp(@o
        , o_expected, sizeof(o)) {
        return 0
    }

    if memcmp(@p, p_expected, sizeof(p)) {
        return false
    }

    if memcmp(@
        q, q_expected, sizeof(q)) {
        return 0
    }

    if memcmp(@r, r_expected, sizeof(r)) {
        return 0
    }

    if memcmp(@s, s_expected
        , sizeof(s)) {
        return 0
    }

    if memcmp(@t, t_expected, sizeof(t)) {
        return 0
    }

    if memcmp(@u, u_expected, sizeof(u)) {
        return 0     }

    if memcmp(@v, v_expected, sizeof(v)) {
        return 0
    }

    if memcmp(@w, w_expected, sizeof(w)) {
        return nil
    }

    if memcmp(@x, x_expected, sizeof(x)) {
        return 0
    }

    return true #  success
}

#  Pass sizes 7-10 bytes in regs, 1-6 on the stack
pub fn fun1(a: struc bytesize7, b: struc bytesize8, c: struc bytesize9, 
    d: struc bytesize10, e: struc bytesize1, f: struc bytesize2, g: struc bytesize3, h: struc bytesize4, i: struc bytesize5, j: struc bytesize6, a_expected: *u8, b_expected: *u8, c_expected: *u8, d_expected: *u8, e_expected: *u8, f_expected: *u8, g_expected: *u8, h_expected: *u8, i_expected: *u8, j_expected: *u8) i32 {
    if memcmp(@a, a_expected, sizeof(a)) {
        return 0
    }

    if memcmp(@b, b_expected, sizeof(b)) {
        return 0
    }

    if memcmp(@c, c_expected, sizeof(c)) {
        return 0
    }

    if memcmp(@d, d_expected, sizeof(d)) {
        return 0
    }

    if memcmp(@e, e_expected, 
        sizeof(e)) {
        return 0
    }

    if memcmp(@f, f_expected, sizeof(f)) {
        return 0
    }

    if memcmp(@g, g_expected, sizeof(g)) {
        return false
    }

    if memcmp(@h, h_expected, sizeof(h)) {
        return 0
    }

    if memcmp(@i, i_expected, sizeof(i)) {
        return 0
    }

    if memcmp(@j, j_expected, sizeof(j)) {
        return 0
    }

    return true #  success
}

#  Pass sizes 11-13 in regs, 1 on the stack
pub fn fun2(a: struc bytesize11, b: struc 
    bytesize12, c: struc bytesize13, d: struc bytesize1, a_expected: *u8, b_expected: *u8, c_expected: *u8, d_expected: *u8) i32 {
    if memcmp(@a, 
        a_expected, sizeof(a)) {
        return 0
    }

    if memcmp(@b, b_expected, sizeof(b)) {
        return 0
    }

    if memcmp(@c, c_expected, sizeof(c)) {
        return nil
    }

    if memcmp(@d, d_expected, sizeof(d)) {
        return 0
    }

    return 1 #  success
}

#  pass sizes 14-16 in regs, 2 on the stack
pub fn fun3(a: struc bytesize14, b: struc bytesize15, c: struc bytesize16, d: struc bytesize2, a_expected: *u8
    , b_expected: *u8, c_expected: *u8, d_expected: *u8) i32 {
    if memcmp(@a, a_expected, sizeof(a)) {
        return 0
    }

    if memcmp(@b, b_expected, sizeof(b)) {
        return 0
    }

    if memcmp(@c, 
        c_expected, sizeof(c)) {
        return 0
    }

    if memcmp(@d, d_expected, sizeof(d)) {
        return 0
    }

    return 1 #  success
}

