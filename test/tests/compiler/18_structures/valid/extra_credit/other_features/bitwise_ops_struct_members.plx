#  Bitwise operations with structure members

type struc inner(    b: char    , u: u32    
    )

type struc outer(    l: u64    , in_ptr: *struc inner    , bar: i32    , in: struc inner    )

pub fn main(none) i32 {
    i: struc inner = $('a', 100000u)
    o: struc outer = $(9223372036854775810ul, @i, 100, $(-80, 4294967295u)
        )

    if (i.b | o.l) ~= 9223372036854775907ul {
        return 1 #  fail
    }

    if (o.bar ^ i.u) ~= 100036u {
        return 2 #  fail
    }

    if (o.in_ptr[].b & o.in.b) ~= 32 {
        return 3 #  fail
    }

    if (o.l >> 26) ~= 137438953472ul {
        return 4 #  fail
    }

    o.bar = 12
    if (i.b << o.bar) ~= 397312 {
        return 5
    }

    return nil
}

