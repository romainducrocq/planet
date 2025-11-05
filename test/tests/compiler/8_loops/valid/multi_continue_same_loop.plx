pub fn main(none) i32 {
    x: i32 = 10
    y: i32 = 0
    z: i32 = 0
    loop .. while z ~= 50 {
        z = z + 1
        if x <= 0 {
            continue
        }
        x = x - 1
        if y >= 10 {
            continue
        }
        y = y + 1
    }
    return z == 50 and x == false and y == 10
}

