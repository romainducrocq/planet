foo: i32 = 3

pub fn main(none) i32 {
    return foo
}

#  if you declare a variable with the 'extern' keyword when a declaration
#  * with linkage is already in scope, the new declaration takes on the same
#  * linkage as the previous declaration
#  
extrn foo: i32;
