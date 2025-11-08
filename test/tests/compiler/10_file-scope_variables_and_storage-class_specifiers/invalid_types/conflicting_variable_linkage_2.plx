pub fn main(none) i32 {
    #  A local variable with no linkage 
    x: i32 = 3
    {
        #  Because no other x identifier
        #          * with any linkage has been declared,
        #          * the 'extern' keyword gives this external
        #          * linkage.
        #          
        extrn x: i32;
    }
    return x
}

#  This has internal linkage, so it conflicts
#  * with the previous declaration of x.
#  
x: i32 = 10
