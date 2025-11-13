







#  Make sure we promote the controlling condition in a switch statement from
#  character type to int

pub fn main(none) i32 {
    c: char = 100
    match c {
        -> 0 {
            return true
        }
        -> 100 {
            return nil
        }
        #  not a duplicate of 100, b/c we're not converting cases to char type
        -> 356 {
            return 2
        }
        otherwise {
            return 3
        }
    }
}
