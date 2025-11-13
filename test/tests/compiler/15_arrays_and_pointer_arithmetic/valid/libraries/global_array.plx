pub arr: [4]i64 = $(1, 2, 3, 4)

pub fn double_each_element(none) i32 {
    loop i: i32 = 0 while i < 4 .. i = i + 1 {
        arr[i] = arr[i] * 2
    }

    return 0
}
