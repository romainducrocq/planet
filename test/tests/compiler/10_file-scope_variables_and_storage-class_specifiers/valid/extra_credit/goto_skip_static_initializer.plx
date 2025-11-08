pub fn main(none) i32 {
    jump end
    #  Since x is static, it's initialized at program startup,
    #      * so its value will be 10 even though we jump over this declaration
    #      
    data x: i32 = 10
    label end
    return x
}
