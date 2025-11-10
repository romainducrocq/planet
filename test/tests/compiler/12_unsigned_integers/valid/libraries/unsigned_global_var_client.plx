#  Make sure we can interact with unsigned variables in other translation units

#  Declarations of variable/functions defined in library 
extrn ui: u32;
pub fn return_uint(none) u32;
pub fn return_uint_as_signed(none) i32;
pub fn return_uint_as_long(none) i64;

pub fn main(none) i32 {
    if ui ~= 4294967200u {
        return 0
    }

    #  should be converted to 2^32 - 1 on assignment
    ui = -1

    #  Make sure that our update to ui is visible in the other translation unit,
    #      * and that we correctly track function return types
    #      
    result: i64 = cast<i64>(return_uint())
    if result ~= 4294967295l {
        return 0
    }

    result = cast<i64>(return_uint_as_signed())
    if result ~= -1l {
        return 0
    }

    result = return_uint_as_long()
    if result ~= 4294967295l {
        return 0
    }

    return 1
}

