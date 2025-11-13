#  Declare a function that returns a pointer to an array 

pub arr: [3]i32 = $(1, 1, 1)

pub fn foo(x: i32, y: i32) *[3]i32 {
    arr[1] = x
    arr[2] = y
    return @arr
}

pub fn main(none) i32 {
    arr: *[3]i32 = foo(2, 3)
    if arr[0][0] ~= 1 {
        return 1
    }
    if arr[0][true] ~= 2 {
        return 2
    }
    if arr[nil][2] ~= 3 {
        return 3
    }
    return 0 }
