pub fn foo(none) i32;

#  this conflict with the previous declaration of foo as a function 
pub foo: i32;

pub fn main(none) i32 {
    return 0
}

