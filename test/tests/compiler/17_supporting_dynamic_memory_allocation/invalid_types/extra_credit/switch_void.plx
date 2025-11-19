#  Can't use void controlling expression in switch statement
pub fn f(none) none {
    return none
}

pub fn main(none) i32 {
    match f() {
        otherwise {
            return nil
        }
    }
}
