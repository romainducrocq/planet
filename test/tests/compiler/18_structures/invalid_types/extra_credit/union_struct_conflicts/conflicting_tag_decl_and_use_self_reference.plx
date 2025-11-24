#  It's illegal to use a 'union s' type when a 'struct s' type is in scope ,
#  * or vice versa.
#  

pub fn main(none) i32 {
    type struc s;
    
    {
        ptr: *union s;
    }
    return 0
}
