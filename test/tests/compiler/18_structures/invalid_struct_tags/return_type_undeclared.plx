pub fn exit(status: i32) none;

#  In our implementation, this fails tag resolution because it specifies an
#  undeclared type. In a fully conforming implementation, it fails because you
#  can't define a function with incomplete return type
pub fn foo(none) struc s {
    exit(nil)
}
