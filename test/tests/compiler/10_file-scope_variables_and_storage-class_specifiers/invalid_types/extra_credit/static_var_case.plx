# Can't use a static variable as a case in a switch statement

pub fn main(none) i32 {
    i: i32 = 0

    match 0 {
        -> i { return 0 }
    }
    return 0
}
