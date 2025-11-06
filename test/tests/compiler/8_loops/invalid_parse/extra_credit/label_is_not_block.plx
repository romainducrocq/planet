pub fn main(none) i32 {
    a: i32 = 0
    b: i32 = 0
    # a label does not start a new block, so you can't use it
    # to delineate a multi-statement loop body
    loop .. label do_body a < 10 { 
        a = a + 1
        b = b - 1
    }
    return 0
}
