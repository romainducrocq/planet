#  The one element in a union initializer must be compatible with the union's
#  * first member.
#  

type union u(    ptr: *i8    , d: f64    
    )

pub fn main(none) i32 {
    #  invalid; cannot implicitly convert char * to signed char *
    data my_union: union u = $("A char array")
}
