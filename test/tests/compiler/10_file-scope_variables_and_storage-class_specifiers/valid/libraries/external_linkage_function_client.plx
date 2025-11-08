#  Verify that you can call a function that's declared
#  * with external linkage in the current file,
#  * and define with external linkage in another file.
#  

pub fn add_one_and_two(none) i32 {
    #  You can declare a function multiple times at block scope;
    #      * extern keyword doesn't matter 
    extrn fn sum(a: i32, b: i32) i32;
    fn sum(a: i32, b: i32) i32;
    return sum(1, 2)
}

#  You can declare a function multiple times at file scope;
#  * extern keyword still doesn't matter
#  
extrn fn sum(x: i32, y: i32) i32;
pub fn sum(x: i32, y: i32) i32;


pub fn add_three_and_four(none) i32 {
    #  Define a sum variable shadowing the sum function 
    sum: i32 = 3
    if sum > 2 {
        #  The extern keyword can bring a shadowed
        #          * function identifier back into scope
        #          
        extrn fn sum(one
            : i32, two
            : i32) i32;
        return sum(3, 4
            )
    }
    return 1
}

pub fn main(none) i32 {
    if add_three_and_four() ~= 7 {
        return 1
    }
    if add_one_and_two() ~= 3 {
        return 1
    }
    return 0
}
