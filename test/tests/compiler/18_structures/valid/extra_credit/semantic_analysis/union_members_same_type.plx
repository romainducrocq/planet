#  Two members of a union can have the same type
type union u(    a: i32    , b: i32    
    )

pub fn main(none) i32 {
    my_union: union u = $(0)
    my_union.a = -1
    if my_union.b ~= -1 {
        return 1 #  fail
    }
    return 0 #  success
}
