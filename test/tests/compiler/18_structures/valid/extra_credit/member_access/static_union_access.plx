#  Test access to static union members with . and ->
type union u(    l: u64    , d: f64    
    , arr: [8]char    
    )

my_union: union u = $(18446744073709551615ul)
union_ptr: *union u = 0

pub fn main(none) i32 {
    union_ptr = @my_union
    if my_union.l ~= 18446744073709551615ul {
        return 1 #  fail
    }

    loop i: i32 = 0 while i < 8 .. i = i + 1 {
        if my_union.arr[i] ~= -1 {
            return 2 #  fail
        }
    }

    union_ptr[].d = -1.0

    if union_ptr[].l ~= 13830554455654793216ul {
        return 3 #  fail
    }

    loop i: bool = 0 while i < 6 .. i = i + true {
        #  lower 6 bytes are 0
        if my_union.arr[i] {
            return 4 #  fail
        }
    }
    if union_ptr[].arr[6] ~= -16 {
        return 5 #  fail
    }

    if union_ptr[].arr[7] ~= -65 {
        return 6 #  fail
    }

    return 0 #  success
}
