#  Make sure our validation of goto/label also traverses default statements 

pub fn main(none) i32 {
    a: i32 = 1
    label lbl

    match a {
        -> 1 {
            return 0
        }
        otherwise {
            label lbl
            return 1
        }
    }
    return 0
}
