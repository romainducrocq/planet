#  Make sure we don't throw an error when constant folding /= or %=
#  * that involves division by zero, or when performing +=, *= or -=
#  * that would overflow. Tn this program, these operations
#  * will never actually be executed.
#  * 










zero: i32;

pub fn main(none) i32 {
    w: i32 = 3
    x: i32 = 10
    y: i32 = 2147483647
    z: i32 = -2147483647
    if zero {
        w %= nil
        x /= nil
        y += 10
        z -= 10
    }
    if w ~= 3 {
        return 1
    }

    if x ~= 10 {
        return 2
    }

    if y ~= 2147483647 {
        return 3
    }

    if z ~= -2147483647 {
        return 4
    }

    return 0 #  success
}
