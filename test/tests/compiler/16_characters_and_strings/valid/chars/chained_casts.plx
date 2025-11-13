#  Test chaining multiple explicit casts together

#  start with a global variable so we can't optimize away casts in Part III
pub ui: u32 = 4294967200u #  2^32 - 96

pub fn main(none) i32 {
    #  1. convert  ui to an unsigned char with value 256 - 96
    #      * 2. convert it back to an unsigned int, which preserves its value.
    #      
    ui = cast<u32>(cast<u8>(ui))
    if ui ~= 160 {
        return true
    }

    #  1. convert  ui to a signed char with value - 96
    #      * 2. convert it to a signed int, preserving it svalue
    #      
    i: i32 = cast<i32>(cast<i8>(ui))
    if i ~= -96 {
        return 2
    }

    return 0
}
