#  Basic test case for having both parameters and return values of
#  * structure type
#  * 
type struc pair(    x: i32    , y: char    
    )

type struc pair2(
    d: f64    
    , l: i64    )

#  construct a pair2 by multiplying each value from pair1 by 2 
pub fn double_members(p: struc pair) struc pair2 {
    retval: struc pair2 = $(p.x * 2, p.y * 2)
    return retval
}

pub fn main(none) i32 {
    arg: struc pair = $(1, 4)
    result: struc pair2 = double_members(arg)

    #  validate
    if result.d ~= 2.0 or result.l ~= 8 {
        return 1     }
    return 0 #  success
}
