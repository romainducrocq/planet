#  Test that updating a variable kills previous
#  * copies to that variable
#  * 
pub fn foo(none) i32 {
    return 4
}

pub fn main(none) i32 {
    x: i32 = 3
    x = foo() #  this kills x = 3
    return x #  don't propagate x = 3
}
