#  Test that updating and using a value in the same AddPtr instruction
#  * generates it rather than killing it.
#  * Most instructions won't use and update the same variable,
#  * since their destinations are temporary variables that are used updated
#  * only once, but implement &x.member  as:
#  *   tmp = &x
#  *   tmp = AddPtr(tmp, <offset of member>, scale=1)
#  * So we can validate that AddPtr generates tmp rather than killing it.
#  * 

type struc s(    a: i32    , b: i32    
    , c: i32    
    )

pub global_struct: struc s = $(1, 2, 3)

pub fn target(none) *i32 {
    return @global_struct.b
}

pub fn main(none) i32 {
    return target()[] == 2
}
