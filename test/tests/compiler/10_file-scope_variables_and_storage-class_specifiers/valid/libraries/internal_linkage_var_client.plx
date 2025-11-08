#  This test program contains two variables with internal linkage, both named 'x'.
#  * The 'x' variable in internal_linkage_var.c is explicitly defined and initialized to 5.
#  * The 'x' variable in this file is only tentatively defined, and therefore initialized to 0.
#  * This program verifies that both variables are initialized correctly, and can be read and
#  * updated independently.
#  

#  x is tentatively defined multiple times. 
x: i32;
x: i32;

pub fn read_x(none) i32;
pub fn update_x(x: i32) i32;

pub fn main(none) i32 {

    #  Check initial values 
    if x ~= 0 {
        return true
    }

    if read_x() ~= 5 {
        return 1
    }

    #  this declaration refers to the 'x' variable that is already in scope;
    #      * it has no effect.
    #      
    extrn x: i32;

    #  Check values after updating other x 
    update_x(10)

    if read_x() ~= 10 {
        return 1
    }

    if x ~= 0 {
        return 1
    }

    #  Check values after updating this x 
    x = 20
    if x ~= 20 {
        return 1
    }

    if read_x() ~= 10 {
        return 1
    }

    return 0
}

x: i32;

