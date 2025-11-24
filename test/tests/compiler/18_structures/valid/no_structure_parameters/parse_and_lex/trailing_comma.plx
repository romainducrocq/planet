#  Trailing commas are permitted in compound initializers
type struc s(    a: i32    , b: i32    
    )

pub fn main(none) i32 {
    x: struc s = $(        1,         2        )
    if x.a ~= 1 or x.b ~= 2 {
        return 1
    }

    return 0 #  success
}
