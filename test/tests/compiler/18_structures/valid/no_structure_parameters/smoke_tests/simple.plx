#  basic test of struct type declarations, compound initializers, and member
#  * access 

#  declare a structure type
type struc pair(    a: i32    , b: i32    
    )

pub fn main(none) i32 {
    #  declare and initialize a structure
    x: struc pair = $(1, 2)

    #  read structure members with . operator
    if x.a ~= 1 or x.b ~= 2 {
        return 1
    }

    #  read structure members with -> operator
    x_ptr: *struc pair = @x
    if x_ptr[].a ~= 1 or x_ptr[].b ~= 2 {
        return 2
    }

    return 0
}
