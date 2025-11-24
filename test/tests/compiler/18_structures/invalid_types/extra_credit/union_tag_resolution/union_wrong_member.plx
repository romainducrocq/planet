type union u(    a: i32    )

pub fn main(none) i32 {
    foo: union u = $(true)

    #  introduce a different union u type
    type union u(        b: i32        
        )
    

    return foo.b #  foo belongs to outer union u type, which doesn't have member 'b'
}
