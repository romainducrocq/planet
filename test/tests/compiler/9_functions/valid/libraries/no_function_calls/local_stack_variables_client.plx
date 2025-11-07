pub fn f(reg1: i32, reg2: i32, reg3: i32, reg4: i32, reg5: i32, reg6: i32, stack1: i32, stack2: i32, stack3: i32) i32;


pub fn main(none) i32 {
    return f(1, 2, 3, 
        4, 5, 
        6, -1, 
        -2, -3)
}
