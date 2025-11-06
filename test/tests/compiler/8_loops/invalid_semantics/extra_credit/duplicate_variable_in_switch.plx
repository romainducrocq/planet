#  test that we perform usual variable resolution/validation for switch
#  statement bodies, including outside of case/default statements
pub fn main(none) i32 {
    a: i32 = 1
    match a {
        #  variable resolution must process this even though it's not reachable;
        #  it still declares the variable/brings it into scope
        b: i32 = 2
        -> 0 {
            a = 3
        }
        b: i32 = 2 #  error - duplicate declaration
    }
    return false
}
