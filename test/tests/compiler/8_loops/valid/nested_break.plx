pub fn main(none) i32 {
    ans: i32 = 0
    loop i: i32 = 0 while i < 10 .. i = i + 1 {
        loop j: i32 = 0 while j < 10 .. j = j + 1 {
            if (i / 2) * 2 == i {
                break }
            else {
                ans = ans + i
            }
        }
    }
    return ans
}

