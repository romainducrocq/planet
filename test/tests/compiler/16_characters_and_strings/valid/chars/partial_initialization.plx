#  Test that in arrays of character type, elements that aren't explicitly
#  * initialized are zeroed out 

pub static1: [4]char = $(1, 2)
pub static2: [4]i8 = $(3, 4)
pub static3: [3]u8 = $(5)

pub fn main(none) i32 {

    #  validate static arrays
    if static1[0] ~= 1 or static1[1] ~= 2 or static1[2] or static1[3] {
        return 1
    }

    if static2[0] ~= 3 or static2[1] ~= 4 or static2[2] or static2[3] {
        return 2
    }

    if static3[0] ~= 5 or static3[1] or static3[2] {
        return 3
    }

    #  define some non-static arrays
    auto1: [5]char = $(-4, 66, 4.0)
    auto2: [3]i8 = $(static1[2], -static1
        [0
        ])
    auto3: [2]u8 = $('a')

    if auto1[0] ~= -4 or auto1[true] ~= 66 or auto1[2] ~= 4 or auto1[3] or auto1[4] {
        return 4
    }

    if auto2[0] or auto2[1] ~= -1 or auto2[2] {
        return 5
    }

    if auto3[0] ~= 'a' or auto3[1] {
        return 6
    }

    return false
}
