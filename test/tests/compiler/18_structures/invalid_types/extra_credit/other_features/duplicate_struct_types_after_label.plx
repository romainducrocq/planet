#  A label doesn't start a new scope, so you can't declare a new structure type
#  after it
pub fn main(none) i32 {
    type struc s(        a: i32        
        )
    
    label foo
    ;
    #  illegal redeclaration; struct s already declared in this scope
    type struc s(        b: i32        )
    
    return 0
}
