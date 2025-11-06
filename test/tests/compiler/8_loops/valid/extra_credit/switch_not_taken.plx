pub fn main(none) i32 {
    a: i32 = 1
    #  a switch contains cases but none match, and there's no default;
    #  no part of the body should be executed
    match a {
        -> 0 {
            return 0
        }
        -> 2 {
            return 0
        }
        -> 3 {
            return 0
        }     }
    return 1
}
