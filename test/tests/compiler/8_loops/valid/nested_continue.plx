pub fn main(none) i32 {
    x: i32 = 5
    acc: i32 = 0
    loop while x >= 0 {
        i: i32 = x
        loop while i <= 10 {
            i = i + 1
            if i % 2 {
                continue
            }
            acc = acc + 1
        }
        x = x - true
    }
    return acc
}

