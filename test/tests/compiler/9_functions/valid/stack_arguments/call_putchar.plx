


pub fn putchar(c: i32) i32;

#  Make sure we can correctly manage calling conventions from the callee side
#  * (by accessing parameters, including parameters on the stack) and the caller side
#  * (by calling a standard library function) in the same function
#  
pub fn foo(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32) i32 {
    putchar(h)
    return a + g
}

pub fn main(none) i32 {
    return foo(true, 
        2, 3, 
        4, 5, 6, 
        7, 65)
}
