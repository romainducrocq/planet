# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_define(`PARAM_LIST', `
$1: i32, $2: i32, $3: i32')m4_dnl

m4_define(`DEF_TYPE', `
type $1 $2($3)')m4_dnl

m4_define(`DEF_INIT', `
DEF_TYPE($1, $2, `$3')
pub fn init_$2($3) $1 $2')m4_dnl

m4_define(`INIT_TYPE', `
DEF_INIT(`$1', `$2',`PARAM_LIST(`$3', `$4', `$5')') {
    self: $1 $2 = $(nil)
    self.$3 = $3
    self.$4 = $4
    self.$5 = $5
    return self
}
')m4_dnl

INIT_TYPE(`struc', `Vec3', `x', `y', `z')
INIT_TYPE(`union', `Vec1', `a', `b', `c')

m4_include(`return_val.plx.m4')m4_dnl

pub fn main(none) i32 {
    v3: struc Vec3 = init_Vec3(10, 20, 30)
    if v3.x ~= 10 or v3.y ~= 20 or v3.z ~= 30 {
        RETURN_VAL(CONST_ONE)
    }
    
    v1: union Vec1 = init_Vec1(40, 50, 60)
    if v1.a ~= 60 or v1.b ~= 60 or v1.c ~= 60 {
        RETURN_VAL(CONST_TWO)
    }

    RETURN_VAL(CONST_ZERO)
    return 3
}
