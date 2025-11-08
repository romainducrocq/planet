#  verify that automatic and external variables with the same name
#  * are distinct, can be read and updated separately,
#  * and can shadow one another
#  

#  a global variable 'a' 
pub a: i32 = 5

pub fn return_a(none) i32 {
    #  return the current value of the global variable 
    return a
}

pub fn main(none) i32 {
    #  automatic variable 'a', distinct from the global variable 'a' 
    a: i32 = 3
    {
        #  this declaration refers to the global variable,
        #          * shadowing the automatic variable declared above
        #          
        extrn a: i32;
        if a ~= 5 {
            return 1
        }
        #  update global variable 
        a = 4
    }
    #  return the sum of the global and local 'a' variables 
    return a + return_a()
}
