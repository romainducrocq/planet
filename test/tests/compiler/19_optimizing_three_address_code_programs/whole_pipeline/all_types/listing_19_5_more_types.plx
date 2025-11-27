#  A variation on listing_19_5.c with types other than int 

#  make flag a global variable rather than a parameter
#  so we don't have any instructions setting up function parameters,
#  e.g. movl %edi, -4(%rbp), which the test script will complain about
pub flag: f64 = 12e5

type struc inner(    a: f64    , b: f64    
    )

type struc s(    ptr: *any    , arr: [5]i64    , x: struc inner    , c: [4]char    )

pub fn target(none) i64 {
    x: u64 = 4
    z: char;
    my_struct: struc s = $(@z,         $(        1l,         2l        ),         $(3., 4.)
        ,         "abc")
    if 4 - x {
        x = my_struct.c[2]
        z = my_struct.arr[1]
        my_struct.x.a = z * 100.
    }
    if not flag {
        z = 10 + cast<*i32>(my_struct.ptr)[]
    }
    z = x + 5
    return z
}

pub fn main(none) bool {
    return target()
}
