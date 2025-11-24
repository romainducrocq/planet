#  YOu can't declare the same union type twice. 

pub fn main(none) i32 {
    type union u(a: i32
        )
    
    type union u(a: i32)
     #  illegal - duplicate declaration
    return 0
}
