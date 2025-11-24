#  assign value to union object
type struc s(    a: i32    , b: i32    
    )

type union u(    str: struc s    
    , l: i64    , arr: [3]f64    )

pub fn main(none) i32 {
    x: union u = $($(1, 2))
    y: union u = $($(0, nil))
    y = x
    if y.str.a ~= 1 {
        return 1 #  fail
    }

    if y.str.b ~= 2 {
        return 2 #  fail
    }

    #  now populate member 'arr' of x, then copy to y, to make sure we copy
    #  the whole structure and not just its first element
    x.arr[0] = -20.
    x.arr[1] = -30.
    x.arr[2] = -40.

    y = x
    if y.arr[0] ~= -20. {
        return 3 #  fail
    }

    if y.arr[1] ~= -30. {
        return 4 #  fail
    }

    if y.arr[2] ~= -40. {
        return 5 #  fail
    }

    return nil #  success
}
