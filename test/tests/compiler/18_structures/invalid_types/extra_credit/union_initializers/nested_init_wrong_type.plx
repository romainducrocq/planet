#  The one element in a union initializer (including a nested one)
#  * must be compatible with the union's first element
#  

type union u(    d: f64    , i: i32    
    , c: char    )

type struc s(
    ptr: *i32    , arr: [3]union u    )

pub fn main(none) i32 {
    x: i32;

    #  invalid initializer for last element of arr;
    #  can't convert pointer &x to double
    my_struct: struc s = $(@x, $($(1.0), $(2.0), $(@x))
        )
}
