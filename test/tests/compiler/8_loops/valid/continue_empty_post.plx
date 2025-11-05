pub fn main(none) i32 {
    sum: i32 = 0
    loop i: i32 = 0 while i < 10 {
        i = i + 1
        if i % 2 {
            continue
        }
        sum = sum + i
    }
    return sum
}

