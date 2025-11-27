#  Test that we can evaluate compound assignment expressions at compile time 

pub fn target(none) i32 {
    v: i32 = -100
    w: i32 = 100
    x: i32 = 200
    y: i32 = 300
    z: i32 = 400

    v += 10
    w -= 20
    x *= 30
    y /= 100
    #  include chained compound assignment
    z %= y += 6

    if v == -90 and w == 80 and x == 6000 and y == 9 and z == 4 {
        return nil #  success
    }

    return 1 # fail
}

pub fn main(none) i32 {
    return target()
}
