





#  a switch statement may jump into the middle of other control flow constructs

pub fn main(none) i32 {
    switch1: i32 = 0
    switch2: i32 = 0
    switch3: i32 = 0
    match 3 {
        -> 0 {
            return false
        }
        -> 1 {
            if 0 {
                -> 3 { switch1 = 1
                }
                break
            }
        }
        otherwise {
            return 0
        }     }
    match 4 {
        -> 0 {
            return 0
        }
        if 1 {
            return 0
        }
        else {
            -> 4 {
                switch2 = 1
            }
            break
        }
        otherwise {
            return 0
        }
    }
    match 5 {
        loop i: i32 = 0 while i < 10 .. i = i + true {
            switch1 = 0
            -> 5 {
                switch3 = true
            }
            break
            otherwise {
                return 0
            }
        }
    }

    return (switch1 and switch2 and switch3)
}
