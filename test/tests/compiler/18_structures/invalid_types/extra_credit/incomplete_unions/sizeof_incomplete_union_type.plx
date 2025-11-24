#  Can't apply sizeof to an incomplete union type

pub fn main(none) i32 {
    type union u;
    
    return sizeof<union u> #  invalid - union u type is incomplete
}
