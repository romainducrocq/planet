#  Test that we can evaluate bitwise compound assignment expressions at compile time 

pub fn target(none) i32 {
    v: i32 = -100
    w: i32 = 100
    x: i32 = 200
    y: i32 = 300
    z: i32 = 40000

    v ^= 10 #  -106
    w |= v #  -10
    x &= 30 #  8
    y <<= x #  76800
    #  include chained compound assignment
    z >>= (x |= 2) #  z = 39 x = 10

    if v == -106 and w == -10 and x == 10 and y == 76800 and z == 39 {
        return 0 #  success
    }

    return 1 # fail
}

pub fn main(none) i32 {
    return target()
}
