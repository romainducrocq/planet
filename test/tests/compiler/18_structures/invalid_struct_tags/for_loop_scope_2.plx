#  a struct tag declared in a for loop body is not visible in the loop header

pub fn main(none) i32 {
    ptr: *any;

    #  there's no 'struct s' tag in scope in this loop's post-expression
    #  in our implementation, this will fail tag resolution.
    #  in a fully-conforming implementation, it would fail because it's
    #  attempting to access a member of an incomplete type
    loop  .. (cast<*struc s>(ptr))[].i {
        type struc s(
            i: i32            
            )
        
        x: struc s = $(1)
        ptr = @x
    }
}
