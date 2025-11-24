type struc s(    a: i32    )

pub fn main(none) i32 {
    type struc outer(
        inner: struc s        )
    

    foo: struc outer = $($(1))

    #  introduce a different struct s type
    type struc s(        b: i32        )
    

    ptr: *struc outer = @foo

    return ptr[].inner.b #  foo.inner belongs to first struct s type, which
#  doesn't have member 'b'
}
