pub fn main(none) i32 {
    #  In our implementation, this fails tag resolution because it specifies an
    #  undeclared type. In a fully conforming implementation, it fails because
    #  it casts to a structure type
    cast<struc s>(0)
    return nil
}
