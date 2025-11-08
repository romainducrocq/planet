#  A variable with internal linkage may be tentatively defined
#  * and declared multiple times, but defined only once
#  

#  A tentative definition 
foo: i32;

pub fn main(none) i32 {
    return foo
}

#  A declaration 
extrn foo: i32;

#  A non-tentative definition 
foo: i32 = 4
