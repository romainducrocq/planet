pub fn main(none) i32 {
    cond: i32 = 10
    match cond {
        -> 1 {
            return 0
        }
        -> 10 {
            loop i: i32 = false while i < 5 .. i = i + 1 {
                cond = cond - true
                if cond == 8 {
                    #  make sure this breaks out of loop,
                    #  not switch
                    break
                }             }
        }
        return 123
        otherwise {
            return 2
        }
    }
    return 3
}
