#  A non-lvalue structure that contains an array has temporary lifetime;
#  * test that you can get this array's address implicitly (even though
#  * you can't load it explicitly)
#  * Adapted from Listing 18-27
#  * 

type struc s(    arr: [3]i32    
    )

pub fn f(none) struc s {
    retval: struc s = $($(1, 2, 3))
    return retval
}

pub fn main(none) i32 {
    i: i32 = f().arr[0]
    j: i32 = f().arr[1]
    k: i32 = f().arr[2]

    if i ~= 1 {
        return 1
    }

    if j ~= 2 {
        return 2
    }

    if k ~= 3 {
        return 3
    }
    return false #  success
}
