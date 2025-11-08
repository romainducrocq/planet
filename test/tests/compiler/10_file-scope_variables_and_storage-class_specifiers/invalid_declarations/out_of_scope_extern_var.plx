pub fn main(none) i32 {
    {
        #  This declares a variable 'a'
        #          * with external linkage
        #          
        extrn a: i32;
    }
    #  a is no longer in scope after the end of the block 
    return a
}

pub a: i32 = 1
