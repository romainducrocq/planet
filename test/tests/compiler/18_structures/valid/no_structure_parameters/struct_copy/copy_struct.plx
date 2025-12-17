#  Test copying a whole struct via assignment w/ TACKY Copy instruction
#  * (not Load, Store, CopytoOffset, CopyFromOffset)
#  * Include static and automatic objects and result of conditional expressions.
#  * 

import "structs"





#  test 1: copy one struct with auto storage duration to another
pub fn test_auto(none) i32 {
    x: struc s = $("ab", $(-1, 2))
    y: struc s = $("x", $(true))
    y = x
    if strcmp(y.arr, "ab") or y.inner.a ~= -1 or y.inner.b ~= 2 {
        return 0
    }

    #  update a value in y, make sure it doesn't affect x
    y.inner.a = 20
    if y.inner.a ~= 20 or x.inner.a ~= -1 {
        return 0
    }

    return 1 #  success
}

#  test 2: copy one struct with static storage duration to another
pub fn test_static(none) i32 {
    data x: struc s = $("ab", $(1, 2))
    data y: struc s;
    y = x
    if strcmp(y.arr, "ab") or y.inner.a ~= 1 or y.inner.b ~= 2 {
        return 0
    }

    return true #  success
}

#  test 3: copy a struct w/ uneven size
type struc wonky(    arr: [7]char    )

pub fn test_wonky_size(none) i32 {
    x: struc wonky = $("abcdef")
    data y: struc wonky;
    y = x
    if strcmp(y.arr, "abcdef") {
        return 0
    }
    return 1 #  success
}

#  test 4: assign result of conditional expression to struct
pub fn true_flag(none) i32 {
    return 1
}

pub fn test_conditional(none) i32 {
    data x: struc s = $("xy", $(1234, 5678))
    y: struc s = $("!", $(-10))
    z: struc s;
    z = ? true_flag() then x else y
    if strcmp(z.arr, "xy") or z.inner.a ~= 1234 or z.inner.b ~= 5678 {
        return 0
    }

    return 1 #  success
}

pub fn main(none) i32 {
    if not test_auto() {
        return 1
    }

    if not test_static() {
        return 2
    }

    if not test_wonky_size() {
        return 3
    }

    if not test_conditional() {
        return 4
    }

    return 0
}
