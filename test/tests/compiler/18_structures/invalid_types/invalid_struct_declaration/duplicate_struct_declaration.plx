pub fn main(none) i32 {
    #  can't declare two structures with the same tag
    #  in the same scope
    type struc x(        x: i32        
        )
    
    type struc x(        y: i32        )
    
    return 0
}
