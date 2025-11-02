pub fn main(none) i32 {
    #  it's valid to use the same identifier as a variable and label
    ident: i32 = 5
    jump ident
    return 0
    label ident
    return ident
}
