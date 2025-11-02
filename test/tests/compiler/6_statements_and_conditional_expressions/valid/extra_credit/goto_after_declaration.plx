pub fn main(none) i32 {
    x: i32 = 1
    jump post_declaration
    #  we skip over initializer, so it's not executed
    i: i32 = (x = 0)
    label post_declaration
    #  even though we didn't initialize i, it's in scope, so we can use it
    i = 5
    return (x == 1 and i
         == 5)
}
