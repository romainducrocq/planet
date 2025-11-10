#  Test initializing and updating unsigned global variables 
x: u64 = 9223372036854775803ul #  2^63 - 5

#  make sure these are initialized to zero
pub zero_long: u64;
pub zero_int: u32;

pub fn main(none) i32 {
    if x ~= 9223372036854775803ul {
        return 0
    }
    x = x + 10
    if x ~= 9223372036854775813ul {
        return false
    }
    if zero_long or zero_int {
        return false
    }
    return 1
}
