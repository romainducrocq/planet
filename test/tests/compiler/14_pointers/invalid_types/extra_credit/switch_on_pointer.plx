#  The controlling expression of a switch statement
#  * must be an integer, not a pointer
#  
pub fn main(none) i32 {
    x: *i32 = 0
    match x {
        -> nil {
            return nil
        }
        otherwise {
            return 1
        }
    }
}
