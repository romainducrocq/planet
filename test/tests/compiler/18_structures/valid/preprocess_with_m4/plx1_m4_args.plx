# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_define(`CALC_FUNC', `
pub fn $1_$2(x: *$2, y: $2) none {
    x[] = x[] $3 y
}
')m4_dnl

m4_define(`CALC_FUNCS', `
CALC_FUNC(`add', $1, `+')
CALC_FUNC(`sub', $1, `-')
CALC_FUNC(`mul', $1, `*')
CALC_FUNC(`div', $1, `/')
')m4_dnl

CALC_FUNCS(i32)
CALC_FUNCS(f64)

m4_include(`return_val.plx.m4')m4_dnl

fn calc_pi(prec: i32) f64 {
    pi: f64 = 0.0
    loop i: i32 = 0 while i < prec .. add_i32(@i, 1) {
        j: i32 = i
        next: f64 = 1.0
        mul_i32(@j, 2)
        add_i32(@j, 1)
        div_f64(@next, j)
        sub_i32(@j, i)
        div_i32(@i, 2)
        div_i32(@j, 2)
        if i == j {
            add_f64(@pi, next)
            j = 0
        }
        else {
            sub_f64(@pi, next)
            j = 1
        }
        mul_i32(@i, 2)
        add_i32(@i, j)
    }
    mul_f64(@pi, 4.0)
    return pi
}

pub fn main(none) i32 {
    pi: f64 = calc_pi(1000)
    if pi < 3.14 or pi >= 3.15 {
        RETURN_VAL(CONST_ONE)
    }

    RETURN_VAL(CONST_ZERO)
    return 2
}
