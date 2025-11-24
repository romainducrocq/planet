pub fn main(none) i32 {
    #  In our implementation, this fails tag resolution because it specifies
    #  an incomplete union type.
    #  In a fully conforming implementation, this would fail because it defines
    #  a variable with incomplete type.

    var: union s;
    return 0
}
