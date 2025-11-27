#  Make sure we detect dead stores to union members 

type union u(    l: i64    , i: i32    
    )

pub global_union: union u = $(10)

pub fn target(none) i32 {
    my_union: union u = $(4)
    my_union.i = 123 #  dead!
    my_union = global_union
    return my_union.i
}

pub fn main(none) i32 {
    return target()
}
