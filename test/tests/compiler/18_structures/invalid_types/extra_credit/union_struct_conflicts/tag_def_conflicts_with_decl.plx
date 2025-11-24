#  You can't declare 'struct s' and define 'union s' or vice versa in same scope
#  * (This test is intended to verify that we detect conflicts between declarations
#  * and definitions rather than just ignoring the declarations/letting the
#  * definitions overwrite them; identical to type_decl_conflicts_with_def with
#  * order of type declarations swapped)
#  * 

pub fn main(none) i32 {
    type union s(#  conflicts w/ earlier declaration
        a: i32        
        )
    
    type struc s;
    

    return 0
}
