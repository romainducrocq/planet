#  Increment and decrement lvalues of unsigned character type
pub fn main(none) i32 {
    chars: [5]u8 = $(0, 2, 4, 253, 255)

    #  validate expression results
    if chars[0]-- { #  result is 0
        return 1 #  fail
    }

    if chars[1]++ ~= 2 {
        return 2 #  fail
    }

    if --chars[3] ~= 252 {
        return 3
    }

    if ++chars[4] ~= nil { #  wraps around
        return 4
    }

    #  validate side effects/updated values
    if chars[0] ~= 255 { #  wraps around
        return 5
    }

    if chars[1] ~= 3 {
        return 6
    }

    if chars[2] ~= 4 { #  we didn't change this one
        return 7
    }

    if chars[3] ~= 252 {
        return 8
    }

    if chars[4] {
        return 9
    }

    return false #  success
}
