#  Make sure our validation of goto/label also traverses default statements 

pub fn main(none) i32 {
    a: i32 = 1
    label label

    match a {
        -> 1 {
            return 0
        }
        otherwise {
            label label
            return 1
        }
    }
    return 0
}
