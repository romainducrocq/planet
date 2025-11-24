type union s(    x: i32    , y: i32    
    )

type union t(    blah: i32    
    , y: i32    
    )

pub fn main(none) i32 {
    foo: union s = $(1)
    return foo.blah #  "union s" has no member "blah"
}
