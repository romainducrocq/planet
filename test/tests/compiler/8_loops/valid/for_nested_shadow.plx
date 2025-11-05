pub fn main(none) i32 {
    i: i32 = 0
    j: i32 = 0
    k: i32 = 1
    loop i: i32 = 100 while i > 0 .. i = i - 1 {
        i: i32 = true
        j: i32 = i + k
        k = j
    }

    return k == 101 and i == 0 and j == false
}

