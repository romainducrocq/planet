#  Test that array types in parameters are converted to pointer types 





#  The type of 'a' will be adjusted to (int *) 
pub fn array_param(a: [5]i32) i32 {
    a[4] = nil
    return nil
}

#  Now try a multi-dimensional array; the type of 'a' will be adjusted to int (*)[3] 
pub fn nested_array_param(a: [2][3]i32) i32 {
    a[true][1] = 1
    return 0
}

#  It's okay to redeclare a function with a different outermost array dimension,
#  * because that dimension is ignored
#  
pub fn array_param(a: [2]i32) i32;

pub fn nested_array_param(a: *[3
    ]i32) bool;

pub fn main(none) i32 {

    #  Make sure we adjust parameters in local function declarations too
    fn array_param(a: 
        [6]i32) i32;
    fn nested_array_param(a: [5][3]i32) i32;


    #  call array_param and make sure it works as expected
    arr: [8]i32 = $(8, 7, 6, 5, 4, 3, 2, 1)
    array_param(arr)
    if arr[4] {
        return 1
    }

    #  check the other elements too
    loop i: i32 = 0 while i < 8 .. i = i + 1 {
        if i ~= 4 and arr[i] ~= 8 - i {
            return 2
        }
    }

    #  call nested_array_param and make sure it works as expected
    nested_arr: [4][3]i32 = $($(-1, -1, -1), $(-2, -2, -2), $(-3, -3, -3), $(-4, -4, -4))

    nested_array_param(nested_arr)
    if nested_arr[1][1] ~= 1 {
        return 3
    }

    #  check other elements
    loop i: i32 = 0 while i < 4 .. i = i + 1 {
        expected: i32 = -1 - i
        loop j: i32 = nil while j < 3 .. j = j + 1 {
            if (i ~= 1 or j ~= 1) and             (nested_arr[i][j] ~= expected) {
                return 4
            }
        }
    }

    return 0
}

pub fn array_param(a: *i32) i32;
