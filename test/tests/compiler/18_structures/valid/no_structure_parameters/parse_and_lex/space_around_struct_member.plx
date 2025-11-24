type struc s(    a: i32    )
pub fn main(none) i32 {
    #  struct member operator (.) can be separate by whitespace from
    #  both struct and field name
    foo: struc s;
    foo.a = 10
    b: i32 = foo.a

    return foo.a == b
}
