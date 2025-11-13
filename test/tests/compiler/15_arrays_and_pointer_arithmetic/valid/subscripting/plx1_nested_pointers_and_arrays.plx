pub fn main(none) i32 {
    x1: i32 = 1
    y1: i32 = 2
    z1: i32 = 3
    x2: i32 = 4
    y2: i32 = 5
    z2: i32 = 6
    x3: i32 = 7
    y3: i32 = 8
    z3: i32 = 9

    arr1: [3]*i32 = $(@x1, @y1, @z1)
    arr2: [3]*i32 = $(@x2, @y2, @z2)
    arr3: [3]*i32 = $(@x3, @y3, @z3)

    ptr_arr1: *[3]*i32 = @arr1
    ptr_arr2: *[3]*i32 = @arr2
    ptr_arr3: *[3]*i32 = @arr3

    arr_ptr_arr: [3]*[3]*i32 = $(
        ptr_arr1,
        ptr_arr2,
        ptr_arr3
    )

    if   arr_ptr_arr[0][][0][] ~= 1 { return 1 }
    elif arr_ptr_arr[0][][1][] ~= 2 { return 2 }
    elif arr_ptr_arr[0][][2][] ~= 3 { return 3 }
    elif arr_ptr_arr[1][][0][] ~= 4 { return 4 }
    elif arr_ptr_arr[1][][1][] ~= 5 { return 5 }
    elif arr_ptr_arr[1][][2][] ~= 6 { return 6 }
    elif arr_ptr_arr[2][][0][] ~= 7 { return 7 }
    elif arr_ptr_arr[2][][1][] ~= 8 { return 8 }
    elif arr_ptr_arr[2][][2][] ~= 9 { return 9 }
    elif arr_ptr_arr[2][][1][] == arr_ptr_arr[1][][1][] { return 10 }
    else {
        y3 = y2
        arr_ptr_arr[0][][2][] = ? (
                arr_ptr_arr[2][][1][] == arr_ptr_arr[1][][1][]
            ) then 0 else 20
        return z1
    }
}
