#  Labels, structure tags, and member names are all different namespaces

pub fn main(none) i32 {
    type struc x(        x: i32        
        )
    
    x: struc x = $(10)
    jump x
    return 0
    label x
    return x.x #  expected result in 10
}
