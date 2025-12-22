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

pub fn main(none) i32 {
    x: i32 = 0
    add_i32(@x, 10)
    sub_i32(@x, 1)
    mul_i32(@x, 9)
    div_i32(@x, 27)
    if x ~= 3 {
        return 1
    }

    d: f64 = 0.0
    add_f64(@d, 13.5)
    sub_f64(@d, 1.1)
    mul_f64(@d, 10.1)
    div_f64(@d, 6.0)
    if d < 20.8 or d > 20.9 {
        return 2
    }

    return 0
}
