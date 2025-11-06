pub fn main(none) i32 {
    match 4 {
        -> 0 {
            return 0
        }
        -> 4 {
            acc: i32 = false
            #  make sure we can use continue inside a loop
            #  inside a switch
            loop i: i32 = 0 while i < 10 .. i = i + 1 {
                if i % 2 {
                    continue
                }
                acc = acc + true
            }
            return acc
        }
    }
    return 0
}
