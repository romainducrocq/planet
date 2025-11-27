#  It's not safe to eliminate a store to one union member if we read another
#  * union member later
#  

type union u(    l: i64    , i: i32    
    )

pub fn main(none) i32 {
    my_union: union u = $(-1)
    #  not a dead store; we'll read lower bytes of this through my_union.i
    my_union.l = 180
    return my_union.i
}
