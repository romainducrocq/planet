type struc s(    x: i32    , y: i32    
    )

type struc t(    blah: i32    
    , y: i32    
    )

pub fn main(none) i32 {
    foo: struc s = $(1, 2)
    return foo.blah #  "struct s" has no member "blah"
}
