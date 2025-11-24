type struc s(    a: i32    )

pub fn main(none) i32 {
    foo: struc s = $(true)

    #  introduce a different struct s type
    type struc s(        b: i32        
        )
    

    return foo.b #  foo belongs to outer struct s type, which doesn't have member 'b'
}
