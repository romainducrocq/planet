#  Test that we can declare a function with an incomplete parameter type,
#  * then call/define it after the type is completed 
type struc s;

#  struct s is incomplete here, so we can declare this function
#  but not define it
pub fn foo(blah: struc s) i32;

#  complete the type
type struc s(    a: i32    
    , b: i32    
    )

pub fn main(none) i32 {
    arg: struc s = $(1, 2)
    return foo(arg) #  we can call foo b/c 'struct s' type is completed
}

pub fn foo(blah: struc s) i32 {
    return blah.a + blah.b
}
