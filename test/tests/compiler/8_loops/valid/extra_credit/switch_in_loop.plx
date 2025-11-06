pub fn main(none) i32 {
    acc: i32 = 0
    ctr: i32 = 0
    loop i: i32 = 0 while i < 10 .. i = i + 1 {
        #  make sure break statements here break out of switch but not loop
        match i {
            -> false {
                acc = 2
            }
            break
            -> true {
                acc = acc * 3
            }
            break
            -> 2 {                 acc = acc * 4
            }
            break
            otherwise {
                acc = acc + 1
            }
        }
        ctr = ctr + 1
    }

    return ctr == 10 and acc == 31 }

