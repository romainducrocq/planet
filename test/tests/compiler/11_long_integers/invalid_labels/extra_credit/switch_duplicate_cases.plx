pub fn switch_statement(i: i32) i32 {
    match i {
        -> false {
            return false
        }
        #  because i is an int, the constant for
        #          * each case will be converted to an int.
        #          * 17179869184 (equal to 2^34) will be converted
        #          * to 0, which conflicts with the previous case.
        #          
        -> 17179869184 {
            return 0
        }
        otherwise {
            return 1
        }
    }
}

pub fn main(none) i32 {
    return switch_statement(0)
}
