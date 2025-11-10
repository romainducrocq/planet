pub foo: i32 = 3

#  It's illegal to declare the same variable
#  * with different types
#  
pub foo: i64;

pub fn main(none) i32 {
    return foo
}
