pub fn main(none) i32 {
    #  In our implementation, this declaration fails tag resolution because the
    #  'struct s' type hasn't been declared.
    #  In a fully conforming implementation it would fail because it's illegal
    #  to specify arrays of incomplete type
    arr: [2]struc s;
    return 0
}
