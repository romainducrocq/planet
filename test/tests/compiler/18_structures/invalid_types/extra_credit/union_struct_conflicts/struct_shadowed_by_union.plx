#  When one type declaration shadows another with the same tag (including a
#  * union type shadowing struct type or vice versa) you can't specify the outer
#  * tag
#  * 
pub fn main(none) i32 {
    type struc tag(a: i32
        )
    
    {
        type union tag(
            l: i64
            )
         #  shadows previous definition of tag
        #  illegal to specify 'struct tag' here b/c it conflicts with
        #  'union tag' declared above
        x: *struc tag;
    }
    return 0
}
