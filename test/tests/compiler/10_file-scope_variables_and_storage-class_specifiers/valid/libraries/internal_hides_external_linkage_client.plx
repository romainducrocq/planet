#  A variable with internal linkage will hide a variable with the same name
#  * in a different file, even if the variable in the other file has external linkage.
#  

x: i32 = 1

#  read the value of this file's x variable
pub fn read_internal_x(none) i32;

#  read the other file's x variable, which has external linkage
pub fn read_x(none) i32;

pub fn main(none) i32 {
    #  This refers to the variable with internal linkage
    #  defined above
    extrn x: i32;
    if x ~= true {
        return true
    }
    #  update x, make sure its value is visible in another function
    x = 2

    if read_internal_x() ~= 2 {
        return 1
    }

    #  validate that other x was defined and initialized correctly
    if read_x() ~= 10 {
        return 1
    }
    return 0
}

#  this refers to the 'x' variable defines in this file with internal linkage
extrn x: i32;

pub fn read_internal_x(none) i32 {
    return x

}
