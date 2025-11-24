#  A union initializer must always have exactly one element,
#  * no matter how many members the union has.
#  

type union u(    a: i32    , b: i64    
    )

pub fn main(none) i32 {
    x: union u = $(1, 2) #  invalid - multiple initializers
    return 0
}

