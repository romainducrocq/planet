#  All union initializers (including nested ones) must have exactly one element 

pub fn main(none) i32 {
    type union u(        d: f64
        , x: i32        )
    
    array_of_unions: [3]union u = $(        #  invalid; each of these must be individually enclosed in braces
        $(1.0, 2.0, 3.0)        )
}
