#  Verify that if variable is tentatively defined one or more times,
#  * but not explicitly initialized, we'll initialize it to 0.
#  

#  This declares foo but does not define it 
extrn foo: i32;

#  A tentative definition of foo 
pub foo: i32;

#  Another tentative definition of foo 
pub foo: i32;

pub fn main(none) i32 {
    loop i: i32 = 0 while i < 5 .. i = i + 1 {
        foo = foo + 1
    }
    return foo
}

#  Yet another tentative definition of foo 
pub foo: i32;
