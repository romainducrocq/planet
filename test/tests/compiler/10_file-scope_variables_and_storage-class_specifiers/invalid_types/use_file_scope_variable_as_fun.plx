#  This declares a global variable 
extrn foo: i32;

pub fn main(none) i32 {
    #  Treating a variable as a function is a type error. 
    return foo()
}
