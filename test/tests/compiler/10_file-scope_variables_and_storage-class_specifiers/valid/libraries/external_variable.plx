#  this function defines a variable with external linkage 

#  a tentative definition of x;
#  * this will be treated like a declaration,
#  * since x is defined later 
pub x: i32;

#  a variable with external linkage can be tentatively defined
#  * and declared multiple times in a file
#  
extrn x: i32;
pub x: i32;

pub fn update_x(new_val: i32) i32 {
    x = new_val
    return 0
}

pub fn read_x(none) i32 {
    return x
}

#  the definition of x 
pub x: i32 = 3
