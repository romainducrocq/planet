pub fn main(none) i32 {
    acc: i32 = 0
    x: i32 = 100
    loop while x {
        y: i32 = 10
        x = x - y
        loop while y {
            acc = acc + 1
            y = y - 1
        }
    }
    return acc == 100 and x == 0

}

