type union u(    x: i32    )

pub fn return_union(none) union u {
    #  define an identical but distinct union type
    type union u(
        x: i32        )
    

    result: union u = $(10)

    #  return it; invalid b/c it's the wrong "union u" type
    return result
}

