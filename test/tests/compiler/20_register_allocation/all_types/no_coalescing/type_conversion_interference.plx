#  Make sure we recognize that each type conversion instruction uses its
#  * source and kills its destination. Just validate behavior, don't inspect
#  * assembly. Some of these test functions only work as intended once
#  * we've implemented register coalescing.
#  

import "../util"

pub glob: i32;

# * movsx *

#  Test that we recognize movsx a, b uses a 
pub fn test_movsx_src(i: i32) i32 {
    #  we'll coalesce i into EDI
    #  if we don't think it's live after check_one_int
    check_one_int(i - 10, -5)
    l: i64 = 0
    l = cast<i64>(i)
    check_one_long(l, 5l)
    return 0
}

#  Test that we recognize movsx a, b updates b 
pub glob_char: i8 = 10
pub fn test_movsx_dst(none) i32 {
    #  Create six callee-saved pseudos that are defined via movsx;
    #  if we don't recognize that movsx updates its destination,
    #  we won't recognize that they conflict, and we'll put at least
    #  two of them in the same pseudoregister.
    #  Use a mix of sign-extension from char and from int.
    a: u64 = id(-true)
    b: u64 = id(2)
    neg_char: char = -glob_char
    not_char: char = ~glob_char
    c: i32 = cast<i32>(glob_char)
    d: i64 = id(4)
    e: u32 = cast<u32>(neg_char)
    f: i64 = cast<i64>(not_char)
    check_one_ulong(a, 18446744073709551615ul)
    check_one_ulong(b, 2ul)
    check_one_int(c, 10)
    check_one_long(d, 4l)
    check_one_uint(e, -10)
    check_one_long(f, -11)
    return 0
}

# * movzx *

#  Test that we recognize that a MovZeroExtend
#  * instruction uses its source. (This test focuses
#  * on MovZeroExtend with Longword source type, which
#  * eventually gets rewritten as a regular mov)
#  
pub glob_uint: u32;
pub fn test_movzx_src(u: u32) i32 {
    #  we'll coalesce u into EDI if we don't think it's
    #  live after check_one_uint
    check_one_uint(u + 10u, 30u)
    l: i64 = cast<i64>(u)
    check_one_long(l, 20l)
    return 0
}

#  Test that we recognize that MovZeroExtend updates its destination
#  * (This test focuses on MovZeroExtend with Longword source type, which
#  * eventually gets rewritten as a regular mov) 
pub fn test_movzx_dst(none) i32 {
    #  Create six callee-saved pseudos defined via MovZeroExtend;
    #  if we don't recognize that MovZeroExtend updates its destination,
    #  we won't recognize that they conflict, and we'll put at least
    #  two of them in the same pseudoregister.
    a: i64 = cast<i64>(unsigned_id(2000u))
    b: u64 = cast<u64>(unsigned_id(1000u))
    c: u64 = cast<u64>(
        unsigned_id(255u))
    d: i64 = cast<i64>(unsigned_id(4294967295u))
    e: i64 = cast<i64>(unsigned_id(2147483650u))
    f: u64 = cast<u64>(unsigned_id(80u))

    check_one_long(a, 2000l)
    check_one_ulong(b, 1000ul)
    check_one_ulong(c, 255ul)
    check_one_long(d, 4294967295l)
    check_one_long(e, 2147483650l)
    check_one_ulong(f, 80ul)
    return 0
}

#  Test that we recognize that movzbq a, b uses a 
pub fn test_movzbq_src(c: u8) i32 {
    #  we'll coalesce c into EDI if we don't
    #  think it's live after check_one_uchar
    d: u8 = c + 1
    check_one_uchar(d, 13)
    l: i64 = cast<i64>(c)
    check_one_long(l, 12)
    return 0
}

#  Test that we recognize that movzb a, b updates b 
pub fn test_movzb_dst(none) i32 {
    #  Create six callee-saved pseudos defined via movzb;
    #  if we don't recognize that movzb updates its destination,
    #  we won't recognize that they conflict, and we'll put at least
    #  two of them in the same pseudoregister.
    a: i32 = cast<i32>(uchar_id(200))
    b: u32 = cast<u32>(uchar_id(100))
    c: u64 = cast<u64>(uchar_id(255))
    d: i64 = cast<i64>(uchar_id(77))
    e: i64 = cast<i64>(uchar_id(125))
    f: u64 = cast<u64>(uchar_id(80))

    check_one_int(a, 200)
    check_one_uint(b, 100u)
    check_one_ulong(c, 255ul)
    check_one_long(d, 77l)
    check_one_long(e, 125l)
    check_one_ulong(f, 80ul)
    return 0
}

# * cvtsi2sd *

#  Test that we recognize cvtsi2sd uses its source 
pub fn test_cvtsi2sd_src(i: i32) i32 {
    #  we'll coalesce i into EDI
    #  if we don't think it's live after check_one_int
    check_one_int(i + 10, 16)
    d: f64 = cast<f64>(i)
    check_one_double(d, 6.0)
    return 0
}

#  Test that we recognize cvtsi2sd updates its destination 
pub global_int: i32 = 5000
pub global_long: i64 = 5005
pub fn test_cvtsi2sd_dst(none) i32 {
    #  Create 15 floating-point pseudos defined via cvtsi2sd;
    #  if we don't recognize that this instruction updates its destination
    #  we won't recognize that they conflict and we'll put at least two of them
    #  in the same register. (A correct register allocator
    #  will spill one of them.)
    #  Use a mix of cvtsi2sdl and cvtsi2sdq.
    d0: f64 = cast<f64>(global_int)
    d1: f64 = cast<f64>((global_long - 4l))
    d2: f64 = cast<f64>((global_int + 2))
    d3: f64 = cast<f64>((global_long - 2l))
    d4: f64 = cast<f64>((global_int + 4))
    d5: f64 = cast<f64>((global_int + 5))
    d6: f64 = cast<f64>((global_int + 6))
    d7: f64 = cast<f64>((global_int + 7))
    d8: f64 = cast<f64>((global_int + 8))
    d9: f64 = cast<f64>((global_int + 9))
    d10: f64 = cast<f64>((global_int + 10))
    d11: f64 = cast<f64>((global_int + 11))
    d12: f64 = cast<f64>((global_int + 12))
    d13: f64 = cast<f64>((global_int + 13))
    d14: f64 = cast<f64>((global_int + 14))
    global_long = cast<i64>(d14)
    check_14_doubles(d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13,         5000)
    check_one_int(global_int, 5000)
    check_one_long(global_long, 5014l)
    return 0
}

# * cvttsd2si *

#  Test that we recognize cvttsd2si a, b uses a 
pub glob_dbl: f64;
pub fn test_cvttsd2si_src(d: f64) i32 {
    #  We'll coalesce d into the tmp that holds d + 10.0
    #  if we don't realize it's still live
    glob_dbl = d + 10.0
    i: i32 = cast<i32>(d)
    check_one_int(i, 7)
    check_one_double(glob_dbl, 17.0
        )
    return 0
}

#  Test that we recognize that cvttsd2si a, b updates b 
pub fn test_cvttsd2si_dst(none) i32 {
    #  Define six callee-saved pseudos defined by cvttsd2si;
    #  if we don't realize this instruction updates its destination,
    #  we won't recognize that they conflict and we'll put at least two
    #  in the same register instead of spilling one of them.
    #  Use a mix of cvttsd2sil and cvttsd2siq
    a: i32 = cast<i32>(dbl_id(-200.0))
    b: i64 = cast<i64>(dbl_id(-300.0))
    c: i32 = cast<i32>(dbl_id(-400.0))
    d: i64 = cast<i64>(dbl_id(-500.0))
    e: i32 = cast<i32>(dbl_id(-600.0))
    f: i64 = cast<i64>(dbl_id(-700.0))
    check_one_int(a, -200)
    check_one_long(b, -300l)
    check_one_int(c, -400)
    check_one_long(d, -500l)
    check_one_int(e, -600)
    check_one_long(f, -700l)
    return 0
}

pub fn main(none) i32 {
    #  movsx
    test_movsx_src(5)
    test_movsx_dst()

    #  movzx
    test_movzx_src(20u)
    test_movzx_dst()
    test_movzbq_src(12)
    test_movzb_dst()

    #  cvtsi2sd
    test_cvtsi2sd_src(6)
    test_cvtsi2sd_dst()

    #  cvttsd2si
    test_cvttsd2si_src(7.0)
    test_cvttsd2si_dst()
    return 0
}
