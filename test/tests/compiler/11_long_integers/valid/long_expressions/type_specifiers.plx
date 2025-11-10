#  Test out different, equivalent ways to declare the same identifier  







#  These declarations all look slightly different,
#  * but they all declare 'a' as a static long, so they don't conflict.
#  
a: i64;
a: i64;
a: i64;

#  These declarations all look slightly different,
#  * but they all declare 'my_function' as a function
#  * with three long parameters and an int return value,
#  * so they don't conflict.
#  
pub fn my_function(a: i64, b: i64, c: i64) i32;
pub fn my_function(x: i64, y: i64, z: i64) i32 {
    return x + y + z
}

pub fn main(none) i32 {
    #  Several different ways to declare local long variables 
    x: i64 = 1l
    y: i64 = 2l
    z: i64 = 3l

    #  This links to the file-scope declarations of 'a' above 
    extrn a: i64;
    a = 4

    #  make sure we can use long type specifier in for loop initializer
    #      * i is 2^40 so this loop should have 41 iterations
    #     
    sum: i32 = 0
    loop i: i64 = 1099511627776l while i > 0 .. i = i / 2 {
        sum = sum + 1
    }

    #  Make sure everything has the expected value 
    if x ~= 1 {
        return 1
    }

    if y ~= 2 {
        return 2
    }

    if a ~= 4 {
        return 3
    }

    if my_function(
        x, y, 
        z) ~= 6 {
        return 4
    }

    if sum ~= 41 {
        return 5
    }
    return false
}
