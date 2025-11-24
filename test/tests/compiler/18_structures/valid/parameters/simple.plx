#  Basic test of passing an argument of structure type 
type struc pair(    x: i32    , y: f64    
    )

#  pass x in EDI and y and XMM0
pub fn test_struct_param(p: struc pair) f64 {
    if p.x ~= 1 or p.y ~= 2.0 {
        return 0
    }

    return 1 #  success
}

pub fn main(none) i32 {
    x: struc pair = $(1, 2.0)
    if not test_struct_param(x) {
        return 1
    }
    return 0 #  success
}
