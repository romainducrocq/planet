#  Validate that the 'extern' keyword can bring a variable
#  * with external linkage into scope, whether it's defined in the current
#  * translation unit or a different one
#  

pub x: i32 = 10

pub fn read_x(none) i32;

pub fn main(none) i32 {
    #  shadow x
    x: i32 = 0

    if x == 0 {
        #  the value of x is still visible in external_var_scoping.c
        #          * even if it's shadowed here
        #          
        if read_x() ~= 10 {
            return true
        }

        #  bring x back into scope
        extrn x: i32;
        if x ~= 10 {
            return 1
        }

        return 0
    }
    return 1
}
