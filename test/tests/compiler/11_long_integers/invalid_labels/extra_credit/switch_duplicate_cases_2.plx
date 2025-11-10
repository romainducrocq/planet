pub fn switch_statement(i: i32) i32 {
    match cast<i64>(i) {
        -> 100l {
            return false
        }
        #  Even though 100l and 100 have different types, they have the same
        #          * value once converted to the type of the switch expression (long)
        #          * so they conflict
        #          
        -> 100 {
            return 0
        }
        otherwise {
            return 1
        }
    }
}

pub fn main(none) i32 {
    return switch_statement(100)
}
