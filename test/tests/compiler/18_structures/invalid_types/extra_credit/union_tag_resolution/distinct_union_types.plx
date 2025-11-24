pub fn foo(none) i32 {
    type union s(        a: i32        
        , b: i64        )
    
    result: union s = $(1)
    return result.a
}

pub fn main(none) i32 {
    #  previously defined union s is not in scope here,
    #  so this is declares a new incomplete type
    type union s;
    
    #  this is illegal because it defines a variable with an incomplete type
    blah: union s = $(foo())
    return blah.a
}
