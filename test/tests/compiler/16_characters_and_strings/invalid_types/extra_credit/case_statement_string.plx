# Can't use strings as labels for case statements
pub fn main(none) i32 {
    match 0 {
        -> "foo" {
            return 1
        }
        otherwise {
            return 0
        }
    }
}
