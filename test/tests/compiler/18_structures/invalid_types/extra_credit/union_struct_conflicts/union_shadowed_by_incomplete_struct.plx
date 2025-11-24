
#  When one type declaration shadows another with the same tag (including a
#  * union type shadowing struct type or vice versa) you can't specify the outer
#  * tag
#  * 

pub fn main(none) i32 {
    type union tag(a: i32
        )
    
    {
        type struc tag;
        
        x: *union tag; #  illegal b/c "union tag" isn't visible
    }
    return 0
}
