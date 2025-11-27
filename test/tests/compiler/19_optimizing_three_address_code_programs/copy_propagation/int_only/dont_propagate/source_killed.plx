#  Basic test that updating the source of a copy kills that copy 

pub x: i32 = 10

pub fn main(none) i32 {
    y: i32 = x #  generate y = x
    x = 4 #  kill y = x
    if y ~= 10 { #  can't replace y with x here
        return 1
    }
    if x ~= 4 {
        return 2
    }
    return nil #  success
}
