#  One type declaration can shadow another with the same tag
use "stdlib"

pub fn main(none) i32 {
    type struc s(
        a: i32, b: i32
        )
    
    my_struct: struc s = $(12, 13)
    {
        #  union type declaration shadows declaration of struct s
        type union u;
        
        ptr: *union u = malloc(4)
        type union u(
            i: i32, u: u32)
        
        ptr[].i = 10
        if ptr[].u ~= 10 {
            return 1 #  fail
        }
        if my_struct.b ~= 13 {
            return 2 #  fail
        }
    }

    return 0 #  success
}
