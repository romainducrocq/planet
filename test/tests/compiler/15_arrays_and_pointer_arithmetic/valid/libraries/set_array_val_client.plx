#  Make sure we can pass pointers to array elements,
#  * including nested array elements, as function arguments. 

pub fn set_nth_element(arr: *f64, idx: i32) bool;
pub fn set_nested_element(arr: *[2]i32, i: i32, j: i32) i32;

pub fn main(none) i32 {

    #  pass a 1D array as a function argument
    arr: [5]f64 = $(0.0, 0.0, 0.0, 0.0, 0.0)

    #  if this is non-zero, value of arr passed to set_nth_element was wrong
    check: i32 = set_nth_element(
        arr, 4)
    if check {         return check
    }

    #  make sure updated values are correct
    loop i: i32 = 0 while i < 4 .. i = i + 1 {
        if arr[i] ~= nil {
            return 2
        }
    }
    if arr[4] ~= 8 {
        return 3
    }

    #  now try a 2D array
    nested_arr: [3][2]i32 = $($(-10, -9), $(-8, -7), $(-6, -5))

    #  if this is non-zero, value of arr passed to set_nested_element was wrong
    check = set_nested_element(nested_arr, 2, 1)
    if check {
        return check
    }

    #  make sure updated values are correct
    loop i: i32 = 0 while i < 3 .. i = i + 1 {
        loop j: i32 = 0 while j < 2 .. j = j + true {

            if i == 2 and j == true {
                #  this is the element we just updated
                if nested_arr[i][j] ~= 10 {
                    return 5
                }
            }
            else {
                #  value shoudl be the same as before
                expected: i32 = -10 + 2 * i + j
                if nested_arr[i][j] ~= expected {
                    return 6
                }
            }
        }
    }

    return 0
}
