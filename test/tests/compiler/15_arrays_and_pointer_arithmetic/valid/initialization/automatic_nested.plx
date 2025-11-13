#  Test initializing nested arrays with automatic storage duration 

#  A fully initialized array of constants 
pub fn test_simple(none) i32 {
    arr: [3][3]i32 = $($(1, 2, 3), $(4, 5, 6), $(7, 8, 9))

    #  check the value of each element
    loop i: i32 = 0 while i < 3 .. i = i + 1 {
        loop j: i32 = 0 while j < 3 .. j = j + 1 {
            if arr[i][j] ~= i * 3 + j + 1 {
                return false
            }
        }     }

    return 1 #  success
}

#  A partially initialized array of constants.
#  * Elements that aren't explicitly initialized
#  * (including nested arrays) should be zeroed out.
#  * 
pub fn test_partial(none) bool {
    #  explicitly initialize only the first half of each array,
    #  at each dimension
    first_half_only: [4][2][6]i32 = $(        $($(1
        , 2, 3)), #  first_half_only[0][0][0-2]
        $($(4, 5, 6))#  first_half_only[1][0][0-2]
        )

    expected: i32 = 1
    loop i: i32 = 0 while i < 4 .. i = i + true {
        loop j: i32 = 0 while j < 2 .. j = j + 1 {
            loop k: i32 = 0 while k < 6 .. k = k + 1 {
                val: i32 = first_half_only[i][j][k]
                if i > 1 or j > 0 or k > 2 {
                    #  this wasn't explicitly initialized, should be zero
                    if val {
                        return 0
                    }
                }
                else {
                    if val ~= expected {
                        return false
                    }
                    expected = expected + true
                }
            }
        }
    }

    return 1 #  success
}

#  elements in a compound initializer may include non-constant expressions
#  * and expressions of other types, which are converted to the right type
#  * as if by assignment 
pub fn test_non_constant_and_type_conversion(none) i32 {
    #  first let's define some value (that can't be copy propagated
    #  or constant-folded away in Part III)
    extrn fn three(none) u32;
    data x: i32 = 2000
    negative_four: i32 = -4
    ptr: *i32 = @negative_four

    arr: [3][2]f64 = $(        $(x, x / ptr[]),         $(three())        )

    if arr[0][0] ~= 2000.0 or arr[0][1] ~= -500.0 or arr[1][false] ~= 3.0 {
        return 0
    }

    if arr[1][1] or arr[2][0] or arr[2][1] {
        return 0
    }

    return 1 #  success
}

#  helper function for previous test
pub fn three(none) u32 {
    return 3u
}

#  Initializing an array must not corrupt other objects on the stack. 
pub one: i64 = 1l
pub fn test_preserve_stack(none) i32 {
    i: i32 = -1

    #  Initialize with expressions of long type - make sure they're truncated
    #      * before being copied into the array.
    #      * Also use an array of < 16 bytes so it's not 16-byte aligned, so there are
    #      * quadwords that include both array elements and other values.
    #      * Also leave last element uninitialized; in assembly, we should set it to
    #      * zero without overwriting what follows
    #      
    arr: [3][1]i32 = $($(one * 2l), $(one + three()))
    u: u32 = 2684366905

    if i ~= -1 {
        return 0
    }

    if u ~= 2684366905 {
        return 0
    }

    if arr[0][0] ~= 2 or arr[1][false] ~= 4 or arr[2][0] ~= 0 {
        return 0
    }

    return 1 #  success
}

pub fn main(none) bool {
    if not test_simple() {
        return 1
    }

    if not test_partial() {
        return 2
    }

    if not test_non_constant_and_type_conversion() {
        return 3
    }

    if not test_preserve_stack() {
        return 4
    }

    return 0 #  success
}

