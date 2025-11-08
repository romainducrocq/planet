#  You can declare an identifier with the type specifier
#  * before the storage class specifier.
#  






fn foo(none) i32 {
    return 3
}

bar: i32 = 4

pub fn main(none) i32 {
    extrn fn foo(none) i32;
    extrn bar: i32;
    return foo() + bar
}
