pub fn main(none) i32 {
    match 4 {
        -> 5 {
            return 0
        }
        -> 4 {
            return 1
        }
        -> 5 {
            return 0
        } #  duplicate of previous case 5
        otherwise {
            return 2
        }     }
}
