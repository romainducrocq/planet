#  Reject duplicate cases where one uses an integer constant and one uses
#  a character constant
pub fn main(none) i32 {
    data i: i32 = 120
    match i {
        -> 'x' { #  ASCII value 120
            return 1
        }
        -> 120 { #  duplicate
            return 2
        }
        otherwise {
            return 3
        }
    }
}
