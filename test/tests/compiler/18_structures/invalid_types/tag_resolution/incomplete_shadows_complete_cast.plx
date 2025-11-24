#  test that we resolve tags in cast expressions
pub fn malloc(size: u64) *any;
type struc s(    a: i32    
    )

pub fn main(none) i32 {
    ptr: *any = malloc(sizeof<struc s>)
    type struc s;
     #  declare a new, incomplete type 'struct s'
    #  this cast is illegal, because the 'struct s' specifier refers to inner,
    #  incomplete type, which does not have a member 'a'
    (cast<*struc s>(ptr))[].a = 10
    return 0
}
