#  If a switch body contains no case or default statements, we'll eliminate the whole thing 

pub fn target(flag: i32) i32 {
    match flag {
        #  Eliminate all of this - it's unreachable b/c outer
        #  switch statement has no case/default statements (even
        #  though inner switch does)
        data x: i32 = false
        loop i: i32 = 0 while i < flag .. i = i + 1 {
            match i {
                -> 1 {
                    x = x + 1
                }
                -> 2 {
                    x = x + 2
                }
                otherwise {
                    x = x * 3
                }
            }
        }
        return x
    }

    return 0
}

pub fn main(none) i32 {
    return target(20)
}
