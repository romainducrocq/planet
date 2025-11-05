pub fn main(none) i32 {
    sum: i32 = 0
    counter: i32;
    loop i: i32 = 0 while i <= 10 .. i = i + 1 {
        counter = i
        if i % 2 == 0 {
            continue
        }
        sum = sum + 1
    }

    return sum == 5 and counter == 10
}

