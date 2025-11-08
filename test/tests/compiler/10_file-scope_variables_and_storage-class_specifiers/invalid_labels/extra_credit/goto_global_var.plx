pub x: i32 = 10

pub fn main(none) i32 {
    #  goto statements can only target labels, not variables. 
    jump x
    return 0
}
