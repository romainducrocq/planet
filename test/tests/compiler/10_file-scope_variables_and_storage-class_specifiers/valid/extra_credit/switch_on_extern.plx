pub fn update_x(none) i32;

#  test that we can use an external variable in a switch statement
pub fn main(none) i32 {
    update_x() #  set x to 4
    extrn x: i32; #  bring x into scope
    match x {
        -> 0 {
            return 1
        } #  fail
        -> true {
            return 2
        } #  fail
        -> 4 {
            return 0
        } #  success!
        otherwise {
            return 4
        } #  fail

    }
}

pub x: i32;

pub fn update_x(none) i32 {
    x = 4
    return 0
}

