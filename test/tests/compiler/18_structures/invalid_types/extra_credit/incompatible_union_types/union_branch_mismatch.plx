#  If either branch of a conditional has union type, branches must have
#  identical types
pub fn main(none) i32 {
    type union u1(        a: i32        
        )
    
    type union u2(        a: i32        )
    
    x: union u1 = $(10)
    y: union u2 = $(11)
    ? 1 then x else y #  mismatch: x and y have different types
    return 0
}
