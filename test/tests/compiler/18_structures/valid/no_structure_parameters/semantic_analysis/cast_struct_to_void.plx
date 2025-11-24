#  You can cast a struct to void,
#  * even though you can't cast it to any other type
#  * 

type struc s(    a: i32    , b: i32    
    )

pub fn main(none) i32 {
    x: struc s = $(1, 2)
    cast<none>(x) #  just make sure this doesn't cause a type error
    return false
}
