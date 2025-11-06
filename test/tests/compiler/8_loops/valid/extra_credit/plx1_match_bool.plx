pub fn main(none) i32 {
    match 1 {
        -> true { return 0 }
        -> false { return 1 }
        otherwise { return 2 }
    }
}
