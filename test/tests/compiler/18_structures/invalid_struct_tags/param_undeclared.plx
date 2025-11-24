#  In our implementation, this function definition fails tag resolution because
#  the 'struct s' type hasn't been declared. In a fully conforming
#  implementation, it would fail because you can't declare incomplete parameter
#  types in function definitions.
pub fn foo(x: struc s) i32 {
    return false
}
