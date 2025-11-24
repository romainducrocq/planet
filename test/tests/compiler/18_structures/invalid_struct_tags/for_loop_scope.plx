pub fn main(none) i32 {
    loop i: i32 = 0 while i < 10 .. i = i + 1 {
        #  test that struct tags are only in scope in block where they're
        #  declared
        type struc s(
            a: i32            )
        
    }

    #  struct s tag is out of scope here
    #  in our implementation this is illegal b/c struct s type is not in scope
    #  in a fully conforming implementation this would be illegal b/c
    #  it declares a variable with incomplete type
    x: struc s;
    return 0
}
