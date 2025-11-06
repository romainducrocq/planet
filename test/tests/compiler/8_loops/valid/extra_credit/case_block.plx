pub fn main(none) i32 {
    a: i32 = 4
    b: i32 = 0
    match 2 {
        #  the substatement of a case statement may be a compound statement
        -> 2 {
            a: i32 = 8
            b = a
        }
    }
    return (a == 4 and b == 8
        )
}
