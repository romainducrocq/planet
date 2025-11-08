#  This declares foo with internal linkage 
foo: i32;

pub fn main(none) i32 {
    return foo
}

#  This declares foo with external linkage,
#  * which conflicts with the previous declaration
#  
pub foo: i32 = 3
