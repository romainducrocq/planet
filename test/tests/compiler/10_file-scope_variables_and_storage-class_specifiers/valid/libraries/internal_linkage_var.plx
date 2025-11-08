#  This file defines and uses a variable with internal linkage. 

#  a tentative definition of x - variables with internal linkage may be tentatively
#  * defined and declared multiple times.
#  
x: i32;

pub fn read_x(none) i32 {
    return x
}

pub fn update_x(new_val: i32) i32 {
    #  this declaration refers to the 'x'
    #      * identifier that is already in scope,
    #      * and takes on the same linkage
    #      
    extrn x: i32;
    x = new_val
    return 0
}


#  since a declaration of x with internal linkage is already in scope,
#  * this takes on that linkage.
#  
extrn x: i32;

#  a non-tentative definition of x
x: i32 = 5

#  yet another tentative definition of x
x: i32;

