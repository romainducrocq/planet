pub fn foo(none) i32 {
    type struc s(        a: i32        
        , b: i32        )
    
    result: struc s = $(1, 2)
    return result.a + result.b
}

pub fn main(none) i32 {
    #  previously defined struct s is not in scope here,
    #  so this is declares a new incomplete type
    type struc s;
    
    #  this is illegal because it defines a variable with an incomplete type
    blah: struc s = $(foo(), foo())
    return blah.a
}
