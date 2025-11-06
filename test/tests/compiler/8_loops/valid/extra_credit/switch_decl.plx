





pub fn main(none) i32 {
    a: i32 = 3
    b: i32 = 0
    match a {
        #  a is in scope but we skip its initializer
        a: i32 = (b = 5)
        -> 3 {
            a = 4
        }
        b = b + a
    }

    #  make sure case was executed but initializer (b = 5) was not
    return a == 3 and b == 4
}
