#  You can't declare a type with a struct specifier and then refer to it with
#  * a union specifier.
#  
type struc x(a: i32)

pub fn main(none) i32 {
    foo: union x; #  incompatible with earlier declration of 'struct x' type
    return nil
}
