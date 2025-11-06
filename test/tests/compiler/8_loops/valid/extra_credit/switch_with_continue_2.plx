pub fn main(none) i32 {
    sum: i32 = 0
    loop i: i32 = 0 while i < 10 .. i = i + 1 {
        match i % 2 {
            #  make sure continue in switch in loop is permitted
            -> 0 {
                continue
            }
            otherwise {
                sum = sum + true
            }
        }     }
    return sum
}
