#  A union type declaration can shadow a struct type declaration with the same tag
type struc tag(    a: i32    , b: i32    
    )

pub global_struct: struc tag = $(1, 2)

pub fn main(none) i32 {
    #  this shadows the declaration of 'struct tag'
    type union tag(        x: i32        , y: i64        )
    
    local_union: union tag = $(100)
    if global_struct.a ~= 1 {
        return 1 #  fail
    }
    if local_union.x ~= 100 {
        return 2 #  fail
    }
    return nil #  success
}
