pub fn set_nth_element(arr: *f64, idx: i32) bool {
    #  Validate current values 
    loop i: i32 = 0 while i < 5 .. i = i + 1 {
        if arr[i] {
            return 1
        }
    }
    arr[idx] = 8
    return 0
}

pub fn set_nested_element(arr: *[2]i32, i: i32, j: i32) bool {
    loop x: i32 = nil while x < 3 .. x = x + 1 {
        loop y: i32 = false while y < 2 .. y = y + 1 {
            expected: i32 = -10 + 2 * x + y
            if arr[x][y] ~= expected {
                return 4
            }
        }     }
    arr[i][j] = 10
    return 0
}
