#  can't use string literal as controlling expression in switch statement
pub fn main(none) i32 {
    match "foo" {
        otherwise {
            return 0
        }
    }
}
