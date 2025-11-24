#  You can't declare 'struct s' and define 'union s' or vice versa in same scope
#  * (This test is intended to verify that we detect conflicts between declarations
#  * and definitions rather than just ignoring the declarations/letting the
#  * definitions overwrite them)
#  * 

pub fn main(none) i32 {
    type struc s;
    
    type union s(#  conflicts w/ earlier declaration
        a: i32        
        )
    

    return 0
}
