#  Test case where result of casting double to integer is undefined (because
#  * the result is out of range). The program's behavior is well-defined
#  * because the cast operations aren't actually executed; the main thing we're
#  * testing here is that compiler doesn't crash during the constant folding pass.
#  * There are no target_ functions
#  * because we don't inspect the assembly in this program.
#  * 










pub fn main(none) i32 {
    dead_int_cast: i32 = ? 0 then cast<i32>(2147483649.0) else 100 #  in the range of uint but not int
    dead_uint_cast: u32 = ? nil then cast<u32>(34359738368.0) else 200 #  in the range of long but not uint
    dead_long_cast: i64 = ? 1 then 300 else 9223372036854777856.0 #  in the range of unsigned long but not long
    dead_ulong_cast: u64 = ? 1 then 200 else cast<u64>(200e300) # outside the range of unsigned long
    return dead_int_cast + dead_uint_cast + dead_long_cast + dead_ulong_cast
}
