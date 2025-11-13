#  Combination of compound assignment and increment/decrement with subscript expressions
pub fn main(none) i32 {
    arr: [4]i32 = $(-1, -2, -3, -4)
    ptr: *i32 = arr
    idx: i32 = 2

    #  arr[2] *= -3;
    #  after expression, ptr points to arr[1] and idx is 3
    if (ptr++[idx++] *= 3) ~= -9 {
        return 1 #  fail
    }
    if ptr[] ~= -2 {
        return 2 #  fail
    }
    if idx ~= 3 {
        return 3 #  fail
    }
    idx--
    #  arr[3] += 4 results in 4
    if (--ptr)[3] += 4 {
        return 4 #  fail
    }

    #  validate all array elements
    if arr[0] ~= -true or arr[1] ~= -2 or arr[2] ~= -9 or arr[3] ~= false {
        return 5 #  fail
    }
    return 0 #  success
}
