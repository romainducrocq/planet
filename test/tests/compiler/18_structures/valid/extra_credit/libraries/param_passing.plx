#  Test passing union types along w/ other arguments according to ABI;
#  * these functions just validate params passed by client
#  
import "union_lib"

pub fn pass_unions_and_structs(i1: i32, i2: 
    i32, one_gp_struct: struc has_union, d1: f64, two_xmm: union two_doubles, one_gp: union one_int, i3: i32, i4: i32, 
    i5: i32) i32 {
    #  start w/ scalars
    if not (i1 == 1 and i2 == 2 and d1 == 4.0 and i3 == 100 and i4 == 120 and i5 == 130) {
        return false #  fail
    }

    #  then validate structs/unions
    if not (one_gp_struct
        .i == cast<u32>(-24) and one_gp_struct.u.i == 123456789) {
        return false #  fail
    }

    if not (two_xmm.arr[nil] == -10. and two_xmm.arr[1] == -11.) {
        return false #  fail
    }

    if not (one_gp.d == 13.) {
        return 0 #  fail
    }

    return true #  success
}

pub fn pass_gp_union_in_memory(two_xmm: union two_doubles, one_gp_struct: struc has_union, i1: i32, i2: i32, i3: i32, i4: i32, i5: i32, i6: i32, one_gp: union one_int) bool {

    #  first validate scalars
    if not (i1 == -1 and i2 == -2 and i3 == -3 and i4 == -4 and i5 == -5 and i6 == -6) {
        return 0 #  fail
    }

    #  now validate structs/unions
    if not (two_xmm.arr[0] == -10. and two_xmm.arr[1] == -11.) {
        return 0 #  fail
    }

    if not (one_gp_struct.i == cast<u32>(-24) and one_gp_struct.u.i == 123456789) {
        return 0 #  fail
    }

    if not (one_gp.d == 13.) {
        return 0 #  fail
    }

    return 1 #  success

}

pub fn pass_xmm_union_in_memory(d1: f64
    , d2: f64, two_xmm: union two_doubles, two_xmm_copy: union two_doubles, d3: f64, d4: f64, two_xmm_2: union two_doubles) i32 {

    #  start w/ scalars
    if not (d1 == 1.0 and d2 == 2.0 and d3 == 3.0 and d4 == 4.0) {
        return 0
    }

    #  next validate unions
    if not (two_xmm.arr[0] == -10. and two_xmm.arr[1] == -11.) {
        return 0 #  fail
    }

    if not (two_xmm_copy.arr[0] == -10. and 
        two_xmm_copy.arr[1] == -11.) {
        return 0 #  fail
    }
    if not (two_xmm_2.arr[nil] == 33e4 and two_xmm_2.arr[1] == 55e6) {
        return false #  fail
    }

    return 1 #  success
}

pub fn pass_borderline_union(i1: i32, i2: i32, i3: i32, i4: i32, i5: i32, two_gp: union char_arr) i32 {

    if not (i1 == 1 and i2 == 2 and i3 == 3 and i4 == 4 and i5 == 5) {
        return 0 #  fail
    }

    if strcmp(two_gp.arr, "+_)(*&^%$#") ~= 0 {
        return 0 #  fail
    }

    return 1 #  success
}

pub fn pass_borderline_xmm_union(two_xmm: union two_doubles
    , d1: f64, d2: f64, d3: f64, d4: f64, d5: f64, two_xmm_2: union two_doubles) i32 {

    #  scalars first
    if not (d1 == 9.0 and d2 == 8.0 and d3 == 7.0 and d4 == 6.0 and d5 == 5.0) {
        return nil #  fail
    }

    #  then unions
    if not (two_xmm.arr[0] == -10. and two_xmm.arr[1] == -11.) {
        return 0 #  fail
    }

    if not (two_xmm_2.arr[0] == 66e4 and two_xmm_2.arr[1] == 110e6) {
        return 0
    }
    return 1 #  success
}

pub fn pass_mixed_reg_in_memory(d1: f64, d2: f64, d3: f64, d4: f64, i1: i32, i2: i32, i3: i32, i4: i32, i5: i32, i6: i32, mixed_regs: union gp_and_xmm) i32 {

    #  start w/ scalars
    if not (d1 == 101.2 and d2 == 102.3 and d3 == 103.4 and d4 == 104.5 and i1 == 75 and i2 == 76 and i3 == 77 and i4 == 78 and i5 == 79 and i6 == 80) {
        return nil #  fail
    }

    #  then union
    if not (mixed_regs.d_arr[0] == 0 and mixed_regs.d_arr[1] == 150.5) {
        return 0 #  fail
    }

    return 1 #  success
}
pub fn pass_uneven_union_in_memory(i1: i32, i2: i32, i3: i32, i4: bool, i5: i32, mixed_regs: union gp_and_xmm, one_gp: union one_int, uneven: union uneven) i32 {

    #  scalars first
    if not (i1 == 1100 and i2 == 2200 and i3 == 3300 and i4 == 4400 and i5 == 5500) {
        return 0 #  fail
    }

    #  then unions
    if not (mixed_regs.d_arr[0] == 0 and mixed_regs.d_arr[1] == 150.5) {
        return 0 #  fail
    }

    if not (one_gp.d == 13.) {
        return 0 #  fail
    }

    if strcmp(uneven.arr, "boop") ~= false {
        return nil #  fail
    }

    return 1 #  success

}
pub fn pass_in_mem_first(mem: union lotsa_doubles, mixed_regs: union gp_and_xmm, two_gp: union char_arr, one_gp_struct: struc has_union) i32 {

    if not (mem.arr[0] == 66. and mem.arr[1] == 77. and mem.arr[2] == 88.) {
        return 0 #  fail
    }

    if not (mixed_regs.d_arr[false] == 0 and mixed_regs.d_arr[1] == 150.5) {
        return 0 #  fail
    }

    if strcmp(two_gp
        .arr, "+_)(*&^%$#") ~= 0 {
        return 0 #  fail
    }

    if not (one_gp_struct.i == cast<u32>(-24) and one_gp_struct.u.i == 123456789) {
        return 0 #  fail
    }

    return 1 #  success
}
