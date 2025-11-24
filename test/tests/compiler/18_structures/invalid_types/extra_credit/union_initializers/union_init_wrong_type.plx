#  The one element in a union initializer must be compatible with the union's
#  * first member.
#  

type union u(    ptr: *i64    , d: f64    
    )

pub fn main(none) i32 {
    #  invalid; cannot implicitly convert double 1.0 to type of first
    #  member (long *)
    my_union: union u = $(1.0)
}
